import 'package:chat_app/core/auth/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';


@singleton
class AuthListener with ChangeNotifier {
  String? _uuid;
  bool _isAuthorized = false;

  AuthListener(AuthService authService) {
    authService.authStateStream.listen((uuid) {
      _uuid = uuid;
      _isAuthorized = _uuid != null;
      notifyListeners();
    });
  }

  bool get isAuthorized => _isAuthorized;
  String? get uuid => _uuid;
}
