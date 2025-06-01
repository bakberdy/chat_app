// import 'package:chat_app/features/auth/data/models/sign_up_with_email_model.dart';
// import 'package:chat_app/features/auth/domain/enitities/sign_up_with_email_entity.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   const tEmail = 'test@example.com';
//   const tPassword = 'password123';
//   const tFirstName = 'firstName';
//   const tLastName = 'lastName';
  
//   late SignUpWithEmailModel tModel;

//   setUp(() {
//     tModel = SignUpWithEmailModel(
//       email: tEmail,
//       password: tPassword,
//       firstName: tFirstName,
//       lastName: tLastName,
//     );
//   });

//   test('should be subclass of Entity', () {
//     expect(tModel, isA<SignUpWithEmailEntity>());
//   });

//   group('toJson', () {
//     test('should return valid JSON', () {
//       final json = tModel.toJson();
//       expect(json, {
//         "email": tEmail,
//         "password": tPassword,
//         "first_name": tFirstName,
//         "last_name": tLastName
//       });
//     });
//   });

//   group('copyWith', () {
//     const tNewFirstName = 'newFirstName';
//     const tNewLastName = 'newLastName';
//     const tNewEmail = 'newEmail@test.com';
//     const tNewPassword = 'newPassword123';

//     test('should update email and keep other fields', () {
//       final result = tModel.copyWith(email: tNewEmail);
      
//       expect(result.email, tNewEmail);
//       expect(result.password, tPassword);
//       expect(result.firstName, tFirstName);
//       expect(result.lastName, tLastName);
//     });

//     test('should update password and keep other fields', () {
//       final result = tModel.copyWith(password: tNewPassword);
      
//       expect(result.password, tNewPassword);
//       expect(result.email, tEmail);
//       expect(result.firstName, tFirstName);
//       expect(result.lastName, tLastName);
//     });

//     test('should update firstName and keep other fields', () {
//       final result = tModel.copyWith(firstName: tNewFirstName);
      
//       expect(result.firstName, tNewFirstName);
//       expect(result.email, tEmail);
//       expect(result.password, tPassword);
//       expect(result.lastName, tLastName);
//     });

//     test('should update lastName and keep other fields', () {
//       final result = tModel.copyWith(lastName: tNewLastName);
      
//       expect(result.lastName, tNewLastName);
//       expect(result.email, tEmail);
//       expect(result.password, tPassword);
//       expect(result.firstName, tFirstName);
//     });

//     test('should update multiple fields', () {
//       final result = tModel.copyWith(
//         email: tNewEmail,
//         lastName: tNewLastName,
//       );
      
//       expect(result.email, tNewEmail);
//       expect(result.lastName, tNewLastName);
//       expect(result.password, tPassword);
//       expect(result.firstName, tFirstName);
//     });

//     test('should create new instance when no changes', () {
//       final result = tModel.copyWith();
      
//       expect(result, isNot(same(tModel)));
//       expect(result, tModel);
//     });
//   });
// }