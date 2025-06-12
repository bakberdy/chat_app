// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// @nodoc

class _Login implements AuthEvent {
  const _Login({required this.emailOrUsername, required this.password});

  final String emailOrUsername;
  final String password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginCopyWith<_Login> get copyWith =>
      __$LoginCopyWithImpl<_Login>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Login &&
            (identical(other.emailOrUsername, emailOrUsername) ||
                other.emailOrUsername == emailOrUsername) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailOrUsername, password);

  @override
  String toString() {
    return 'AuthEvent.login(emailOrUsername: $emailOrUsername, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$LoginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) _then) =
      __$LoginCopyWithImpl;
  @useResult
  $Res call({String emailOrUsername, String password});
}

/// @nodoc
class __$LoginCopyWithImpl<$Res> implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(this._self, this._then);

  final _Login _self;
  final $Res Function(_Login) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? emailOrUsername = null,
    Object? password = null,
  }) {
    return _then(_Login(
      emailOrUsername: null == emailOrUsername
          ? _self.emailOrUsername
          : emailOrUsername // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Register implements AuthEvent {
  const _Register(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.username});

  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String username;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterCopyWith<_Register> get copyWith =>
      __$RegisterCopyWithImpl<_Register>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Register &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, firstName, lastName, username);

  @override
  String toString() {
    return 'AuthEvent.register(email: $email, password: $password, firstName: $firstName, lastName: $lastName, username: $username)';
  }
}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) =
      __$RegisterCopyWithImpl;
  @useResult
  $Res call(
      {String email,
      String password,
      String firstName,
      String lastName,
      String username});
}

/// @nodoc
class __$RegisterCopyWithImpl<$Res> implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? username = null,
  }) {
    return _then(_Register(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ChangeRegistrationStatus implements AuthEvent {
  const _ChangeRegistrationStatus({required this.status});

  final RegistrationState status;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeRegistrationStatusCopyWith<_ChangeRegistrationStatus> get copyWith =>
      __$ChangeRegistrationStatusCopyWithImpl<_ChangeRegistrationStatus>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeRegistrationStatus &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'AuthEvent.changeRegisterStatus(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ChangeRegistrationStatusCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$ChangeRegistrationStatusCopyWith(_ChangeRegistrationStatus value,
          $Res Function(_ChangeRegistrationStatus) _then) =
      __$ChangeRegistrationStatusCopyWithImpl;
  @useResult
  $Res call({RegistrationState status});
}

/// @nodoc
class __$ChangeRegistrationStatusCopyWithImpl<$Res>
    implements _$ChangeRegistrationStatusCopyWith<$Res> {
  __$ChangeRegistrationStatusCopyWithImpl(this._self, this._then);

  final _ChangeRegistrationStatus _self;
  final $Res Function(_ChangeRegistrationStatus) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_ChangeRegistrationStatus(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as RegistrationState,
    ));
  }
}

/// @nodoc

class _ChangeTimeDuration implements AuthEvent {
  const _ChangeTimeDuration({required this.timeDuration});

  final int timeDuration;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeTimeDurationCopyWith<_ChangeTimeDuration> get copyWith =>
      __$ChangeTimeDurationCopyWithImpl<_ChangeTimeDuration>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeTimeDuration &&
            (identical(other.timeDuration, timeDuration) ||
                other.timeDuration == timeDuration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeDuration);

  @override
  String toString() {
    return 'AuthEvent.changeTimeDuration(timeDuration: $timeDuration)';
  }
}

/// @nodoc
abstract mixin class _$ChangeTimeDurationCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$ChangeTimeDurationCopyWith(
          _ChangeTimeDuration value, $Res Function(_ChangeTimeDuration) _then) =
      __$ChangeTimeDurationCopyWithImpl;
  @useResult
  $Res call({int timeDuration});
}

/// @nodoc
class __$ChangeTimeDurationCopyWithImpl<$Res>
    implements _$ChangeTimeDurationCopyWith<$Res> {
  __$ChangeTimeDurationCopyWithImpl(this._self, this._then);

  final _ChangeTimeDuration _self;
  final $Res Function(_ChangeTimeDuration) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timeDuration = null,
  }) {
    return _then(_ChangeTimeDuration(
      timeDuration: null == timeDuration
          ? _self.timeDuration
          : timeDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ChangePassword implements AuthEvent {
  const _ChangePassword({required this.newPassword, required this.oldPassword});

  final String newPassword;
  final String oldPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangePasswordCopyWith<_ChangePassword> get copyWith =>
      __$ChangePasswordCopyWithImpl<_ChangePassword>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangePassword &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPassword, oldPassword);

  @override
  String toString() {
    return 'AuthEvent.changePassword(newPassword: $newPassword, oldPassword: $oldPassword)';
  }
}

/// @nodoc
abstract mixin class _$ChangePasswordCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$ChangePasswordCopyWith(
          _ChangePassword value, $Res Function(_ChangePassword) _then) =
      __$ChangePasswordCopyWithImpl;
  @useResult
  $Res call({String newPassword, String oldPassword});
}

/// @nodoc
class __$ChangePasswordCopyWithImpl<$Res>
    implements _$ChangePasswordCopyWith<$Res> {
  __$ChangePasswordCopyWithImpl(this._self, this._then);

  final _ChangePassword _self;
  final $Res Function(_ChangePassword) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? newPassword = null,
    Object? oldPassword = null,
  }) {
    return _then(_ChangePassword(
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: null == oldPassword
          ? _self.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _GetMe implements AuthEvent {
  const _GetMe();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetMe);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.getMe()';
  }
}

/// @nodoc

class _Logout implements AuthEvent {
  const _Logout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.logOut()';
  }
}

/// @nodoc

class _UpdateProfilePicture implements AuthEvent {
  const _UpdateProfilePicture({required this.file});

  final File? file;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
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
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @override
  String toString() {
    return 'AuthEvent.updateProfilePicture(file: $file)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProfilePictureCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$UpdateProfilePictureCopyWith(_UpdateProfilePicture value,
          $Res Function(_UpdateProfilePicture) _then) =
      __$UpdateProfilePictureCopyWithImpl;
  @useResult
  $Res call({File? file});
}

/// @nodoc
class __$UpdateProfilePictureCopyWithImpl<$Res>
    implements _$UpdateProfilePictureCopyWith<$Res> {
  __$UpdateProfilePictureCopyWithImpl(this._self, this._then);

  final _UpdateProfilePicture _self;
  final $Res Function(_UpdateProfilePicture) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? file = freezed,
  }) {
    return _then(_UpdateProfilePicture(
      file: freezed == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _UpdateUserData implements AuthEvent {
  const _UpdateUserData(
      {required this.username,
      required this.lastName,
      required this.firstName,
      required this.birthDate});

  final String? username;
  final String? lastName;
  final String? firstName;
  final String? birthDate;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateUserDataCopyWith<_UpdateUserData> get copyWith =>
      __$UpdateUserDataCopyWithImpl<_UpdateUserData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateUserData &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, username, lastName, firstName, birthDate);

  @override
  String toString() {
    return 'AuthEvent.updateUserData(username: $username, lastName: $lastName, firstName: $firstName, birthDate: $birthDate)';
  }
}

/// @nodoc
abstract mixin class _$UpdateUserDataCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$UpdateUserDataCopyWith(
          _UpdateUserData value, $Res Function(_UpdateUserData) _then) =
      __$UpdateUserDataCopyWithImpl;
  @useResult
  $Res call(
      {String? username,
      String? lastName,
      String? firstName,
      String? birthDate});
}

/// @nodoc
class __$UpdateUserDataCopyWithImpl<$Res>
    implements _$UpdateUserDataCopyWith<$Res> {
  __$UpdateUserDataCopyWithImpl(this._self, this._then);

  final _UpdateUserData _self;
  final $Res Function(_UpdateUserData) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? username = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_UpdateUserData(
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _ResetPassword implements AuthEvent {
  const _ResetPassword({required this.email});

  final String email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResetPasswordCopyWith<_ResetPassword> get copyWith =>
      __$ResetPasswordCopyWithImpl<_ResetPassword>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetPassword &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'AuthEvent.resetPassword(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$ResetPasswordCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$ResetPasswordCopyWith(
          _ResetPassword value, $Res Function(_ResetPassword) _then) =
      __$ResetPasswordCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$ResetPasswordCopyWithImpl<$Res>
    implements _$ResetPasswordCopyWith<$Res> {
  __$ResetPasswordCopyWithImpl(this._self, this._then);

  final _ResetPassword _self;
  final $Res Function(_ResetPassword) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_ResetPassword(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AuthState {
  AuthStatus get authState;
  RegistrationState get registrationState;
  StateStatus get status;
  ResetPasswordState get resetPasswordState;
  UserEntity? get currentUser;
  int? get timerDuration;
  String? get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<AuthState> get copyWith =>
      _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthState &&
            (identical(other.authState, authState) ||
                other.authState == authState) &&
            (identical(other.registrationState, registrationState) ||
                other.registrationState == registrationState) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.resetPasswordState, resetPasswordState) ||
                other.resetPasswordState == resetPasswordState) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.timerDuration, timerDuration) ||
                other.timerDuration == timerDuration) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authState, registrationState,
      status, resetPasswordState, currentUser, timerDuration, message);

  @override
  String toString() {
    return 'AuthState(authState: $authState, registrationState: $registrationState, status: $status, resetPasswordState: $resetPasswordState, currentUser: $currentUser, timerDuration: $timerDuration, message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) =
      _$AuthStateCopyWithImpl;
  @useResult
  $Res call(
      {AuthStatus authState,
      RegistrationState registrationState,
      StateStatus status,
      ResetPasswordState resetPasswordState,
      UserEntity? currentUser,
      int? timerDuration,
      String? message});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authState = null,
    Object? registrationState = null,
    Object? status = null,
    Object? resetPasswordState = null,
    Object? currentUser = freezed,
    Object? timerDuration = freezed,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      authState: null == authState
          ? _self.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      registrationState: null == registrationState
          ? _self.registrationState
          : registrationState // ignore: cast_nullable_to_non_nullable
              as RegistrationState,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      resetPasswordState: null == resetPasswordState
          ? _self.resetPasswordState
          : resetPasswordState // ignore: cast_nullable_to_non_nullable
              as ResetPasswordState,
      currentUser: freezed == currentUser
          ? _self.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      timerDuration: freezed == timerDuration
          ? _self.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _AuthState implements AuthState {
  const _AuthState(
      {this.authState = AuthStatus.notAuthorized,
      this.registrationState = RegistrationState.nameInput,
      this.status = StateStatus.initial,
      this.resetPasswordState = ResetPasswordState.initial,
      this.currentUser,
      this.timerDuration,
      this.message});

  @override
  @JsonKey()
  final AuthStatus authState;
  @override
  @JsonKey()
  final RegistrationState registrationState;
  @override
  @JsonKey()
  final StateStatus status;
  @override
  @JsonKey()
  final ResetPasswordState resetPasswordState;
  @override
  final UserEntity? currentUser;
  @override
  final int? timerDuration;
  @override
  final String? message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            (identical(other.authState, authState) ||
                other.authState == authState) &&
            (identical(other.registrationState, registrationState) ||
                other.registrationState == registrationState) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.resetPasswordState, resetPasswordState) ||
                other.resetPasswordState == resetPasswordState) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.timerDuration, timerDuration) ||
                other.timerDuration == timerDuration) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authState, registrationState,
      status, resetPasswordState, currentUser, timerDuration, message);

  @override
  String toString() {
    return 'AuthState(authState: $authState, registrationState: $registrationState, status: $status, resetPasswordState: $resetPasswordState, currentUser: $currentUser, timerDuration: $timerDuration, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) _then) =
      __$AuthStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AuthStatus authState,
      RegistrationState registrationState,
      StateStatus status,
      ResetPasswordState resetPasswordState,
      UserEntity? currentUser,
      int? timerDuration,
      String? message});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? authState = null,
    Object? registrationState = null,
    Object? status = null,
    Object? resetPasswordState = null,
    Object? currentUser = freezed,
    Object? timerDuration = freezed,
    Object? message = freezed,
  }) {
    return _then(_AuthState(
      authState: null == authState
          ? _self.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      registrationState: null == registrationState
          ? _self.registrationState
          : registrationState // ignore: cast_nullable_to_non_nullable
              as RegistrationState,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      resetPasswordState: null == resetPasswordState
          ? _self.resetPasswordState
          : resetPasswordState // ignore: cast_nullable_to_non_nullable
              as ResetPasswordState,
      currentUser: freezed == currentUser
          ? _self.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      timerDuration: freezed == timerDuration
          ? _self.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
