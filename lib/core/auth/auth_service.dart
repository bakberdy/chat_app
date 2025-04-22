import 'dart:async';

import 'package:injectable/injectable.dart';

@singleton
class AuthService {
  final StreamController<String?> _authController = StreamController<String?>.broadcast();

  Stream<String?> get authStateStream => _authController.stream;

  void updateAuthState(String? uuid) {
    _authController.add(uuid);
  }

  void dispose() {
    _authController.close();
  }
}
