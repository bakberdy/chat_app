import 'dart:io';

import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/settings/profile/data/data_source/profile_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

@Singleton(as: ProfileRemoteDataSource)
class ProfileSupabaseDataSource implements ProfileRemoteDataSource {
  final SupabaseClient client;
  final Talker talker;

  ProfileSupabaseDataSource(this.client, this.talker);
  @override
  Future<void> updateProfileData(
      {required String userId,
      String? firstName,
      String? lastName,
      String? birthDate}) async {
    try {
      //save to db
      await client.rest.from('profiles').update({
        "first_name": firstName,
        "last_name": lastName,
        "birth_date": birthDate,
      }).eq('uid', userId);
    } on PostgrestException catch (e) {
      talker.error(e.message);
      throw Exception(e.message);
    } catch (e) {
      talker.error(e.toString());
    }
  }

  @override
  Future<void> updateProfilePicture(
      {required String userId, required File picture}) async {
    try {
      //get type of file
      final fileExtention = path.extension(picture.path);
      final contentType = lookupMimeType(fileExtention);

      //upload picture to the storage
      final fullPath = await client.storage.from('profile').upload(
          Uuid().v4(), picture,
          fileOptions: FileOptions(contentType: contentType));
      talker.info('Profile picture uploaded: $fullPath');

      //save picture path to database
      await client.rest
          .from('profiles')
          .update({'profile_picture': fullPath}).eq('uid', userId);
      talker.info('Profile picture path updated in database');

      //update last_online
      await client.rpc('update_last_online', params: {'p_uid': userId});
    } on PostgrestException catch (e) {
      talker.error(e.message);
      throw Exception(e.message);
    } on StorageException catch (e) {
      talker.error(e.toString());
      throw Exception(e.message);
    } catch (e) {
      talker.error(e.toString());
      throw Exception('Failed to update profile picture');
    }
  }

  @override
  Future<UserModel> getUserProfile({required String userId}) async {
    try {
      final response =
          await client.rest.from('profiles').select('*').eq('uid', userId);
      if (response.isNotEmpty) {
        final user = UserModel.fromJson(response[0]);
        return user;
      } else {
        throw Exception('The user doesn\'t exist');
      }
    } on PostgrestException catch (e) {
      talker.error(e.message);
      throw Exception(e.message);
    } catch (e) {
      talker.error(e.toString());
      rethrow;
    }
  }
}
