// import 'auth_service.dart';
// import '../shared/entities/entities.dart';
// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';

// @singleton
// class AuthListener with ChangeNotifier {
//   String? _userId;
//   final AuthService _authService;

//   AuthListener(this._authService) {
//     _authService.authStateStream.listen((userId) {
//       _userId = userId;
//       notifyListeners();
//     });
//   }

//   bool get isAuthorized => _userId != null;

//   String? get uuid => _userId;

//   void signOut() {
//     _authService.signOut();
//     _userId = null;
//     notifyListeners();
//   }
// }
