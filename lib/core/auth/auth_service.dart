// import 'dart:async';

// import 'package:injectable/injectable.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:talker_flutter/talker_flutter.dart';

// @singleton
// class AuthService {
//   final SupabaseClient _supabaseClient;
//   final Talker _talker;

//   AuthService(this._supabaseClient, this._talker);

//   final StreamController<String?> _authController =
//       StreamController<String?>.broadcast();

//   Stream<String?> get authStateStream => _authController.stream;

//   void init() {
//     _supabaseClient.auth.onAuthStateChange.listen((data) {
//       final session = data.session;
//       _authController.add(session?.user.id);
//     });
//   }

//   Future<void> signOut() async {
//     try {
//       await _supabaseClient.auth.signOut();
//     } catch (e, s) {
//       _talker.error('Error during sign out', e, s);
//     } finally {
//       _authController.add(null);
//     }
//   }

//   void dispose() {
//     _authController.close();
//   }
// }
