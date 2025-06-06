// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEvent {
  String get userId;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileEventCopyWith<ProfileEvent> get copyWith =>
      _$ProfileEventCopyWithImpl<ProfileEvent>(
          this as ProfileEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileEvent &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @override
  String toString() {
    return 'ProfileEvent(userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) _then) =
      _$ProfileEventCopyWithImpl;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res> implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._self, this._then);

  final ProfileEvent _self;
  final $Res Function(ProfileEvent) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _GetCurrentUserProfile implements ProfileEvent {
  _GetCurrentUserProfile({required this.userId});

  @override
  final String userId;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetCurrentUserProfileCopyWith<_GetCurrentUserProfile> get copyWith =>
      __$GetCurrentUserProfileCopyWithImpl<_GetCurrentUserProfile>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetCurrentUserProfile &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @override
  String toString() {
    return 'ProfileEvent.getCurrentUserProfile(userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$GetCurrentUserProfileCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory _$GetCurrentUserProfileCopyWith(_GetCurrentUserProfile value,
          $Res Function(_GetCurrentUserProfile) _then) =
      __$GetCurrentUserProfileCopyWithImpl;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$GetCurrentUserProfileCopyWithImpl<$Res>
    implements _$GetCurrentUserProfileCopyWith<$Res> {
  __$GetCurrentUserProfileCopyWithImpl(this._self, this._then);

  final _GetCurrentUserProfile _self;
  final $Res Function(_GetCurrentUserProfile) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
  }) {
    return _then(_GetCurrentUserProfile(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UpdateProfileData implements ProfileEvent {
  _UpdateProfileData(
      {required this.userId, this.firstName, this.lastName, this.birthDate});

  @override
  final String userId;
  final String? firstName;
  final String? lastName;
  final String? birthDate;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateProfileDataCopyWith<_UpdateProfileData> get copyWith =>
      __$UpdateProfileDataCopyWithImpl<_UpdateProfileData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProfileData &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, firstName, lastName, birthDate);

  @override
  String toString() {
    return 'ProfileEvent.updateProfileData(userId: $userId, firstName: $firstName, lastName: $lastName, birthDate: $birthDate)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProfileDataCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory _$UpdateProfileDataCopyWith(
          _UpdateProfileData value, $Res Function(_UpdateProfileData) _then) =
      __$UpdateProfileDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId, String? firstName, String? lastName, String? birthDate});
}

/// @nodoc
class __$UpdateProfileDataCopyWithImpl<$Res>
    implements _$UpdateProfileDataCopyWith<$Res> {
  __$UpdateProfileDataCopyWithImpl(this._self, this._then);

  final _UpdateProfileData _self;
  final $Res Function(_UpdateProfileData) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_UpdateProfileData(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _UpdateProfilePicture implements ProfileEvent {
  _UpdateProfilePicture({required this.userId, required this.picture});

  @override
  final String userId;
  final File picture;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateProfilePictureCopyWith<_UpdateProfilePicture> get copyWith =>
      __$UpdateProfilePictureCopyWithImpl<_UpdateProfilePicture>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProfilePicture &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, picture);

  @override
  String toString() {
    return 'ProfileEvent.updateProfilePicture(userId: $userId, picture: $picture)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProfilePictureCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory _$UpdateProfilePictureCopyWith(_UpdateProfilePicture value,
          $Res Function(_UpdateProfilePicture) _then) =
      __$UpdateProfilePictureCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, File picture});
}

/// @nodoc
class __$UpdateProfilePictureCopyWithImpl<$Res>
    implements _$UpdateProfilePictureCopyWith<$Res> {
  __$UpdateProfilePictureCopyWithImpl(this._self, this._then);

  final _UpdateProfilePicture _self;
  final $Res Function(_UpdateProfilePicture) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? picture = null,
  }) {
    return _then(_UpdateProfilePicture(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _self.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc
mixin _$ProfileState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState()';
  }
}

/// @nodoc
class $ProfileStateCopyWith<$Res> {
  $ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}

/// @nodoc

class ProfileInitial implements ProfileState {
  ProfileInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.initial()';
  }
}

/// @nodoc

class ProfileLoading implements ProfileState {
  ProfileLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.loading()';
  }
}

/// @nodoc

class ProfileLoaded implements ProfileState {
  ProfileLoaded({required this.currentUserProfile});

  final UserEntity currentUserProfile;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileLoadedCopyWith<ProfileLoaded> get copyWith =>
      _$ProfileLoadedCopyWithImpl<ProfileLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileLoaded &&
            (identical(other.currentUserProfile, currentUserProfile) ||
                other.currentUserProfile == currentUserProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentUserProfile);

  @override
  String toString() {
    return 'ProfileState.loaded(currentUserProfile: $currentUserProfile)';
  }
}

/// @nodoc
abstract mixin class $ProfileLoadedCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory $ProfileLoadedCopyWith(
          ProfileLoaded value, $Res Function(ProfileLoaded) _then) =
      _$ProfileLoadedCopyWithImpl;
  @useResult
  $Res call({UserEntity currentUserProfile});
}

/// @nodoc
class _$ProfileLoadedCopyWithImpl<$Res>
    implements $ProfileLoadedCopyWith<$Res> {
  _$ProfileLoadedCopyWithImpl(this._self, this._then);

  final ProfileLoaded _self;
  final $Res Function(ProfileLoaded) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentUserProfile = null,
  }) {
    return _then(ProfileLoaded(
      currentUserProfile: null == currentUserProfile
          ? _self.currentUserProfile
          : currentUserProfile // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class ProfileSuccess implements ProfileState {
  ProfileSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.success()';
  }
}

/// @nodoc

class ProfileError implements ProfileState {
  ProfileError({required this.message});

  final String message;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileErrorCopyWith<ProfileError> get copyWith =>
      _$ProfileErrorCopyWithImpl<ProfileError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProfileState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ProfileErrorCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory $ProfileErrorCopyWith(
          ProfileError value, $Res Function(ProfileError) _then) =
      _$ProfileErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProfileErrorCopyWithImpl<$Res> implements $ProfileErrorCopyWith<$Res> {
  _$ProfileErrorCopyWithImpl(this._self, this._then);

  final ProfileError _self;
  final $Res Function(ProfileError) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ProfileError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
