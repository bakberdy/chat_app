import 'package:chat_app/core/auth/auth_service.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:flutter/widgets.dart';
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
