import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';

class SignInWithEmailModel extends SignInWithEmailEntity {
  SignInWithEmailModel({required super.email, required super.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  SignInWithEmailModel copyWith({String? email, String? password}) {
    return SignInWithEmailModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory SignInWithEmailModel.fromEntity(SignInWithEmailEntity entity) {
    return SignInWithEmailModel(
      email: entity.email,
      password: entity.password,
    );
  }
}
