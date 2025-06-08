import 'package:chat_app/core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@Singleton(as: TokenStorage)
class TokenSecureStorageImpl implements TokenStorage{
  final FlutterSecureStorage _flutterSecureStorage;
  final Talker talker;

  TokenSecureStorageImpl(this._flutterSecureStorage, this.talker);
  @override
  Future<void> clearToken() async {
    try{
    await _flutterSecureStorage.delete(key: 'access_token');
    await _flutterSecureStorage.delete(key: 'refresh_token');}
    catch (e, s){
      talker.error(e, s);
      throw TokenException(e.toString());
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try{
      final accessToken = await _flutterSecureStorage.read(key: 'access_token');
      return accessToken;
    }catch(e, s){
      talker.error(e, s);
      throw TokenException(e.toString());
    }
  }

  @override
  Future<String?> getRefreshToken() async {
   try{
      final refreshToken = await _flutterSecureStorage.read(key: 'access_token');
      return refreshToken;
    }catch(e, s){
      talker.error(e, s);
      throw TokenException(e.toString());
    }
  }

  @override
  Future<void> saveAccessToken(String token) async {
     try{
       await _flutterSecureStorage.write(key: 'access_token', value: token);
    }
    catch(e, s){
      talker.error(e, s);
      throw TokenException(e.toString());
    }
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    try{
      await _flutterSecureStorage.write(key: 'refresh_token', value: token);
    }
    on DioException
    catch(e, s){
      talker.error(e, s);
      throw TokenException(e.toString());
    }
  }
}