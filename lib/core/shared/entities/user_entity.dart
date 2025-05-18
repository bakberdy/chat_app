import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String? firstName;
  final String? lastName;
  final String email;
  final String? profilePicture;
  final DateTime createdAt;
  final DateTime lastOnline;
  final String? birthDate;
  final String? userStatus; //banned, active
  final String? birthDateFormatted; // format this to dd/MM/yyyy

  const UserEntity(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.profilePicture,
      required this.createdAt,
      required this.lastOnline,
      required this.birthDate,
      required this.userStatus,
      this.birthDateFormatted});

  @override
  List<Object?> get props => [uid];

  factory UserEntity.empty() {
    return UserEntity(
      uid: '_empty.Uid',
      firstName: '_empty.FirstName',
      lastName: '_empty.LastName',
      email: '_empty.Email',
      profilePicture: null,
      createdAt: DateTime(0),
      lastOnline: DateTime(0),
      birthDate: null,
      userStatus: null,
    );
  }

  @override
  String toString() {
    return '''
${{
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profilePicture': profilePicture,
      'createdAt': createdAt.toIso8601String(),
      'lastOnline': lastOnline.toIso8601String(),
      'birthDate': birthDate,
      'userStatus': userStatus,
      'birthDateFormatted': birthDateFormatted,
    }}
''';
  }
}
