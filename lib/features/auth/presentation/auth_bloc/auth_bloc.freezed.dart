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

class _SignIn implements AuthEvent {
  const _SignIn({required this.email, required this.password});

  final String email;
  final String password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInCopyWith<_SignIn> get copyWith =>
      __$SignInCopyWithImpl<_SignIn>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignIn &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'AuthEvent.signIn(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$SignInCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) _then) =
      __$SignInCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$SignInCopyWithImpl<$Res> implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(this._self, this._then);

  final _SignIn _self;
  final $Res Function(_SignIn) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_SignIn(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SignUp implements AuthEvent {
  const _SignUp(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});

  final String email;
  final String password;
  final String firstName;
  final String lastName;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignUpCopyWith<_SignUp> get copyWith =>
      __$SignUpCopyWithImpl<_SignUp>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUp &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, firstName, lastName);

  @override
  String toString() {
    return 'AuthEvent.signUp(email: $email, password: $password, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class _$SignUpCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$SignUpCopyWith(_SignUp value, $Res Function(_SignUp) _then) =
      __$SignUpCopyWithImpl;
  @useResult
  $Res call({String email, String password, String firstName, String lastName});
}

/// @nodoc
class __$SignUpCopyWithImpl<$Res> implements _$SignUpCopyWith<$Res> {
  __$SignUpCopyWithImpl(this._self, this._then);

  final _SignUp _self;
  final $Res Function(_SignUp) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_SignUp(
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
    ));
  }
}

/// @nodoc

class _ChangeSignUpStatus implements AuthEvent {
  const _ChangeSignUpStatus({required this.status});

  final SignUpStatus status;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeSignUpStatusCopyWith<_ChangeSignUpStatus> get copyWith =>
      __$ChangeSignUpStatusCopyWithImpl<_ChangeSignUpStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeSignUpStatus &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'AuthEvent.changeSignUpStatus(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ChangeSignUpStatusCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$ChangeSignUpStatusCopyWith(
          _ChangeSignUpStatus value, $Res Function(_ChangeSignUpStatus) _then) =
      __$ChangeSignUpStatusCopyWithImpl;
  @useResult
  $Res call({SignUpStatus status});
}

/// @nodoc
class __$ChangeSignUpStatusCopyWithImpl<$Res>
    implements _$ChangeSignUpStatusCopyWith<$Res> {
  __$ChangeSignUpStatusCopyWithImpl(this._self, this._then);

  final _ChangeSignUpStatus _self;
  final $Res Function(_ChangeSignUpStatus) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_ChangeSignUpStatus(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SignUpStatus,
    ));
  }
}

/// @nodoc

class _GoogleSignIn implements AuthEvent {
  const _GoogleSignIn();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GoogleSignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.googleSignIn()';
  }
}

/// @nodoc

class _AppleSignIn implements AuthEvent {
  const _AppleSignIn();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AppleSignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.appleSignIn()';
  }
}

/// @nodoc

class _SendResetMessageToEmail implements AuthEvent {
  const _SendResetMessageToEmail({required this.email});

  final String email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendResetMessageToEmailCopyWith<_SendResetMessageToEmail> get copyWith =>
      __$SendResetMessageToEmailCopyWithImpl<_SendResetMessageToEmail>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendResetMessageToEmail &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'AuthEvent.sendResetMessageToEmail(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$SendResetMessageToEmailCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$SendResetMessageToEmailCopyWith(_SendResetMessageToEmail value,
          $Res Function(_SendResetMessageToEmail) _then) =
      __$SendResetMessageToEmailCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$SendResetMessageToEmailCopyWithImpl<$Res>
    implements _$SendResetMessageToEmailCopyWith<$Res> {
  __$SendResetMessageToEmailCopyWithImpl(this._self, this._then);

  final _SendResetMessageToEmail _self;
  final $Res Function(_SendResetMessageToEmail) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_SendResetMessageToEmail(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
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
mixin _$AuthState {
  StateStatus get signInStatus;
  SignUpStatus get signUpStatus;
  ResetPasswordStatus get resetPassword;
  int? get timerDuration;
  String? get errorMessage;

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
            (identical(other.signInStatus, signInStatus) ||
                other.signInStatus == signInStatus) &&
            (identical(other.signUpStatus, signUpStatus) ||
                other.signUpStatus == signUpStatus) &&
            (identical(other.resetPassword, resetPassword) ||
                other.resetPassword == resetPassword) &&
            (identical(other.timerDuration, timerDuration) ||
                other.timerDuration == timerDuration) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signInStatus, signUpStatus,
      resetPassword, timerDuration, errorMessage);

  @override
  String toString() {
    return 'AuthState(signInStatus: $signInStatus, signUpStatus: $signUpStatus, resetPassword: $resetPassword, timerDuration: $timerDuration, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) =
      _$AuthStateCopyWithImpl;
  @useResult
  $Res call(
      {StateStatus signInStatus,
      SignUpStatus signUpStatus,
      ResetPasswordStatus resetPassword,
      int? timerDuration,
      String? errorMessage});
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
    Object? signInStatus = null,
    Object? signUpStatus = null,
    Object? resetPassword = null,
    Object? timerDuration = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      signInStatus: null == signInStatus
          ? _self.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      signUpStatus: null == signUpStatus
          ? _self.signUpStatus
          : signUpStatus // ignore: cast_nullable_to_non_nullable
              as SignUpStatus,
      resetPassword: null == resetPassword
          ? _self.resetPassword
          : resetPassword // ignore: cast_nullable_to_non_nullable
              as ResetPasswordStatus,
      timerDuration: freezed == timerDuration
          ? _self.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _AuthState implements AuthState {
  const _AuthState(
      {this.signInStatus = StateStatus.initial,
      this.signUpStatus = SignUpStatus.initial,
      this.resetPassword = ResetPasswordStatus.initial,
      this.timerDuration,
      this.errorMessage});

  @override
  @JsonKey()
  final StateStatus signInStatus;
  @override
  @JsonKey()
  final SignUpStatus signUpStatus;
  @override
  @JsonKey()
  final ResetPasswordStatus resetPassword;
  @override
  final int? timerDuration;
  @override
  final String? errorMessage;

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
            (identical(other.signInStatus, signInStatus) ||
                other.signInStatus == signInStatus) &&
            (identical(other.signUpStatus, signUpStatus) ||
                other.signUpStatus == signUpStatus) &&
            (identical(other.resetPassword, resetPassword) ||
                other.resetPassword == resetPassword) &&
            (identical(other.timerDuration, timerDuration) ||
                other.timerDuration == timerDuration) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signInStatus, signUpStatus,
      resetPassword, timerDuration, errorMessage);

  @override
  String toString() {
    return 'AuthState(signInStatus: $signInStatus, signUpStatus: $signUpStatus, resetPassword: $resetPassword, timerDuration: $timerDuration, errorMessage: $errorMessage)';
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
      {StateStatus signInStatus,
      SignUpStatus signUpStatus,
      ResetPasswordStatus resetPassword,
      int? timerDuration,
      String? errorMessage});
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
    Object? signInStatus = null,
    Object? signUpStatus = null,
    Object? resetPassword = null,
    Object? timerDuration = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_AuthState(
      signInStatus: null == signInStatus
          ? _self.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      signUpStatus: null == signUpStatus
          ? _self.signUpStatus
          : signUpStatus // ignore: cast_nullable_to_non_nullable
              as SignUpStatus,
      resetPassword: null == resetPassword
          ? _self.resetPassword
          : resetPassword // ignore: cast_nullable_to_non_nullable
              as ResetPasswordStatus,
      timerDuration: freezed == timerDuration
          ? _self.timerDuration
          : timerDuration // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
