import 'package:chat_app/core/auth/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';


@singleton
class AuthListener with ChangeNotifier {
  String? _uuid;

  AuthListener(AuthService authService) {
    authService.authStateStream.listen((uuid) {
      _uuid = uuid;
      notifyListeners();
    });
  }

  bool get isAuthorized => _uuid!=null;
  String? get uuid => _uuid;
}
