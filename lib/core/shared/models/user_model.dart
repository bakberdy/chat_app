import 'package:chat_app/core/error/error.dart';
import 'package:chat_app/core/shared/entities/entities.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.username,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.createdAt,
      super.profilePicture,
      super.birthDate,
      super.userStatus, required super.lastOnlineAt});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    try{
      return UserModel(
        id: map['id'] as int,
        firstName: map['first_name'] as String,
        lastName: map['last_name'] as String,
        email: map['email'] as String,
        createdAt: DateTime.parse(map['created_at'] as String),
        profilePicture: map['profile_picture'] as String?,
        birthDate: map['birth_date'] as String?,
        userStatus: map['user_status'] as String?, 
        username: '${map['username']}', 
        lastOnlineAt: DateTime.parse('${map['last_online_at']}'),
    );
    } catch (e) {
      throw ParsingDataException('Error parsing UserModel from map: $e');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'created_at': createdAt.toIso8601String(),
      'profile_picture': profilePicture,
      'birth_date': birthDate,
      'user_status': userStatus,
      'last_online_at': lastOnlineAt.toIso8601String(),
    };
  }

  UserModel copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? createdAt,
    String? profilePicture,
    String? birthDate,
    String? userStatus,
    DateTime? lastOnlineAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      profilePicture: profilePicture ?? this.profilePicture,
      birthDate: birthDate ?? this.birthDate,
      userStatus: userStatus ?? this.userStatus, lastOnlineAt: 
      lastOnlineAt ?? this.lastOnlineAt,
    );
  }
}
