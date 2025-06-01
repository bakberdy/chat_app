import 'auth_service.dart';
import '../shared/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthListener with ChangeNotifier {
  UserEntity? _currentUser;
  final AuthService _authService;

  AuthListener(this._authService) {
    _authService.authStateStream.listen((user) {
      _currentUser = user;
      notifyListeners();
    });
  }

  UserEntity? get currentUser => _currentUser;

  bool get isAuthorized => _currentUser != null;

  String? get uuid => _currentUser?.uid;

  void signOut() {
    _authService.signOut();
    _currentUser = null;
    notifyListeners();
  }
}
