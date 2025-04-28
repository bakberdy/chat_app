import 'package:chat_app/features/auth/domain/enitities/sign_up_with_email_entity.dart';

class SignUpWithEmailModel extends SignUpWithEmailEntity{
  SignUpWithEmailModel({required super.email, required super.password, required super.firstName, required super.lastName});
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  SignUpWithEmailModel copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) {
    return SignUpWithEmailModel(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  factory SignUpWithEmailModel.fromEntity(SignUpWithEmailEntity entity) {
    return SignUpWithEmailModel(
      email: entity.email,
      password: entity.password,
      firstName: entity.firstName,
      lastName: entity.lastName,
    );
  }
}