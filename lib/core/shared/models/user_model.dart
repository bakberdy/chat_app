import 'package:chat_app/core/shared/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.uid,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.createdAt,
      required super.lastOnline,
      super.profilePicture,
      super.birthDate,
      super.userStatus});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      email: map['email'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      lastOnline: DateTime.parse(map['last_online'] as String),
      profilePicture: map['profile_picture'] as String?,
      birthDate: map['birth_date'] as String?,
      userStatus: map['user_status'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'created_at': createdAt.toIso8601String(),
      'last_online': lastOnline.toIso8601String(),
      'profile_picture': profilePicture,
      'birth_date': birthDate,
      'user_status': userStatus,
    };
  }

  UserModel copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? createdAt,
    DateTime? lastOnline,
    String? profilePicture,
    String? birthDate,
    String? userStatus,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      lastOnline: lastOnline ?? this.lastOnline,
      profilePicture: profilePicture ?? this.profilePicture,
      birthDate: birthDate ?? this.birthDate,
      userStatus: userStatus ?? this.userStatus,
    );
  }
}
