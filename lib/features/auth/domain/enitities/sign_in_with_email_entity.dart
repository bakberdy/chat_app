import 'package:equatable/equatable.dart';

class SignInWithEmailEntity extends Equatable {
  final String email;
  final String password;

  const SignInWithEmailEntity({required this.email, required this.password});

  @override
  String toString() {
    return '{\n  "email: $email\n  "password":$password\n}';
  }

  @override
  List<Object?> get props => [email, password];
}
