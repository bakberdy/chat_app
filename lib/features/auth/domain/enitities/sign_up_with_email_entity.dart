import 'package:equatable/equatable.dart';

class SignUpWithEmailEntity extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String password;

  SignUpWithEmailEntity(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.password});

  @override
  String toString() {
    return '''
  {
    'email': $email,
    'firstName': $firstName,
    'lastName': $lastName,
    'password': $password,
  }
''';
  }

  @override
  List<Object?> get props => [email, lastName, firstName, password];
}
