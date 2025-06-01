// import 'package:chat_app/features/auth/data/models/sign_in_with_email_model.dart';
// import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   const tEmail = 'test@example.com';
//   const tPassword = 'password123';
//   var tModel = SignInWithEmailModel(email: tEmail, password: tPassword);

//   test('should be subclass of Entity', () {
//     expect(tModel, isA<SignInWithEmailEntity>());
//   });

//   group('toJson', () {
//     test('should return valid JSON of SignInWithEmailModel', () {
//       final json = tModel.toJson();
//       expect(json, {
//         "email": tEmail,
//         "password": tPassword,
//       });
//     });
//   });

//   group('copyWith', (){
//     final tNewEmail = 'newEmail';
//     final tNewPassword = 'newPassword';

//     test('should return UserModel with different Email', (){
//       final result = tModel.copyWith(email: tNewEmail);
//       expect(result.email, equals(tNewEmail));
//     });

//     test('should return UserModel with different Password', (){
//       final result = tModel.copyWith(password: tNewPassword);
//       expect(result.password, equals(tNewPassword));
//     });

//   });
// }
