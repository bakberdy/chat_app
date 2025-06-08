import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final String email;
  final String? profilePicture;
  final DateTime createdAt;
  final String? birthDate;
  final DateTime lastOnlineAt; // default to now
  final String? userStatus; //banned, active
  final String? birthDateFormatted; // format this to dd/MM/yyyy\
  final String username;

  const UserEntity(
      {required this.id,
      required this.lastOnlineAt,
      required this.firstName,
      required this.username, 
      required this.lastName,
      required this.email,
      this.profilePicture,
      required this.createdAt,
      required this.birthDate,
      required this.userStatus,
      this.birthDateFormatted});

  @override
  List<Object?> get props => [id];

  factory UserEntity.empty() {
    return UserEntity(
      id: 0,
      firstName: '_empty.FirstName',
      lastName: '_empty.LastName',
      email: '_empty.Email',
      profilePicture: null,
      createdAt: DateTime(0),
      birthDate: null,
      userStatus: null, username: '_empty.Username', 
      lastOnlineAt: DateTime.now(),
    );
  }

}
