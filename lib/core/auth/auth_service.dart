import 'dart:async';

import 'package:chat_app/core/error/exception.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

@singleton
class AuthService {
  final SupabaseClient _supabaseClient;
  final Talker _talker;

  AuthService(this._supabaseClient, this._talker);

  final StreamController<UserEntity?> _authController =
      StreamController<UserEntity?>.broadcast();

  Stream<UserEntity?> get authStateStream => _authController.stream;

  void init() {
    _supabaseClient.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null) {
        updateAuthState(session.user.id);
      } else {
        updateAuthState(null);
      }
    });
  }

  Future<void> updateAuthState(String? uuid) async {
    if (uuid != null) {
      try {
        final user = await getCurrentUser(uuid);
        _authController.add(user);
      } catch (e, s) {
        _talker.error('Failed to update auth state', e, s);
        _authController.add(null);
      }
    } else {
      _authController.add(null);
    }
  }

  Future<void> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
    } catch (e, s) {
      _talker.error('Error during sign out', e, s);
    } finally {
      updateAuthState(null);
    }
  }

  Future<UserEntity> getCurrentUser(String uuid) async {
    try {
      final data =
          await _supabaseClient.from('profiles').select().eq('uid', uuid);
      final user = UserModel.fromMap(data[0]);
      return user;
    } on PostgrestException catch (e, s) {
      _talker.error('Supabase DB error', e, s);
      throw ServerException(e.message);
    } catch (e, s) {
      _talker.error('Unknown error fetching current user', e, s);
      throw UnknownException('Unknown error ${e.toString()}');
    }
  }

  void dispose() {
    _authController.close();
  }
}
