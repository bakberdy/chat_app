import 'dart:async';

import 'package:chat_app/core/error/exception.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@singleton
class AuthService {
  final SupabaseClient _supabaseClient;
  AuthService(this._supabaseClient) {
    _supabaseClient.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      if (session != null) {
        updateAuthState(session.user.id);
      } else {
        updateAuthState(null);
      }
    });
  }

  final StreamController<UserEntity?> _authController =
      StreamController<UserEntity?>.broadcast();

  Stream<UserEntity?> get authStateStream => _authController.stream;

  // Обновление состояния с передачей UserEntity
  Future<void> updateAuthState(String? uuid) async {
    if (uuid != null) {
      try {
        final user = await getCurrentUser(uuid);
        _authController.add(user);
      } catch (e) {
        print('Error fetching user data: $e');
        _authController.add(null); 
      }
    } else {
      _authController.add(null);
    }
  }

  void signOut() async {
    await _supabaseClient.auth.signOut();
    updateAuthState(null);
  }

  Future<UserEntity> getCurrentUser(String uuid) async {
    try {
      final data =
          await _supabaseClient.from('profiles').select().eq('uid', uuid);
      final user = UserModel.fromMap(data[0]);
      return user;
    } on PostgrestException catch (e) {
      print('Error on getting current user from db ${e.message}');
      throw ServerException(e.message);
    } catch (e) {
      print('Unknown error on getting current user from db ${e.toString()}');
      throw UnknownException('Unknown error ${e.toString()}');
    }
  }

  void dispose() {
    _authController.close();
  }
}
