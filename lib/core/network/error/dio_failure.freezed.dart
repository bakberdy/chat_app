// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DioFailure {
  String get message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DioFailureCopyWith<DioFailure> get copyWith =>
      _$DioFailureCopyWithImpl<DioFailure>(this as DioFailure, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DioFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DioFailureCopyWith<$Res> {
  factory $DioFailureCopyWith(
          DioFailure value, $Res Function(DioFailure) _then) =
      _$DioFailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DioFailureCopyWithImpl<$Res> implements $DioFailureCopyWith<$Res> {
  _$DioFailureCopyWithImpl(this._self, this._then);

  final DioFailure _self;
  final $Res Function(DioFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UnauthorizedFailure extends DioFailure {
  const UnauthorizedFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith =>
      _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnauthorizedFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.unauthorized(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(
          UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) =
      _$UnauthorizedFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UnauthorizedFailureCopyWithImpl<$Res>
    implements $UnauthorizedFailureCopyWith<$Res> {
  _$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final UnauthorizedFailure _self;
  final $Res Function(UnauthorizedFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UnauthorizedFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ForbiddenFailure extends DioFailure {
  const ForbiddenFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForbiddenFailureCopyWith<ForbiddenFailure> get copyWith =>
      _$ForbiddenFailureCopyWithImpl<ForbiddenFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForbiddenFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.forbidden(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ForbiddenFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $ForbiddenFailureCopyWith(
          ForbiddenFailure value, $Res Function(ForbiddenFailure) _then) =
      _$ForbiddenFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ForbiddenFailureCopyWithImpl<$Res>
    implements $ForbiddenFailureCopyWith<$Res> {
  _$ForbiddenFailureCopyWithImpl(this._self, this._then);

  final ForbiddenFailure _self;
  final $Res Function(ForbiddenFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ForbiddenFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class NotFoundFailure extends DioFailure {
  const NotFoundFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotFoundFailureCopyWith<NotFoundFailure> get copyWith =>
      _$NotFoundFailureCopyWithImpl<NotFoundFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotFoundFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.notFound(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NotFoundFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $NotFoundFailureCopyWith(
          NotFoundFailure value, $Res Function(NotFoundFailure) _then) =
      _$NotFoundFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NotFoundFailureCopyWithImpl<$Res>
    implements $NotFoundFailureCopyWith<$Res> {
  _$NotFoundFailureCopyWithImpl(this._self, this._then);

  final NotFoundFailure _self;
  final $Res Function(NotFoundFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NotFoundFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class InternalServerErrorFailure extends DioFailure {
  const InternalServerErrorFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InternalServerErrorFailureCopyWith<InternalServerErrorFailure>
      get copyWith =>
          _$InternalServerErrorFailureCopyWithImpl<InternalServerErrorFailure>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InternalServerErrorFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.internalServerError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $InternalServerErrorFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $InternalServerErrorFailureCopyWith(InternalServerErrorFailure value,
          $Res Function(InternalServerErrorFailure) _then) =
      _$InternalServerErrorFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$InternalServerErrorFailureCopyWithImpl<$Res>
    implements $InternalServerErrorFailureCopyWith<$Res> {
  _$InternalServerErrorFailureCopyWithImpl(this._self, this._then);

  final InternalServerErrorFailure _self;
  final $Res Function(InternalServerErrorFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(InternalServerErrorFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ServiceUnavailableFailure extends DioFailure {
  const ServiceUnavailableFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceUnavailableFailureCopyWith<ServiceUnavailableFailure> get copyWith =>
      _$ServiceUnavailableFailureCopyWithImpl<ServiceUnavailableFailure>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceUnavailableFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.serviceUnavailable(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ServiceUnavailableFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $ServiceUnavailableFailureCopyWith(ServiceUnavailableFailure value,
          $Res Function(ServiceUnavailableFailure) _then) =
      _$ServiceUnavailableFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ServiceUnavailableFailureCopyWithImpl<$Res>
    implements $ServiceUnavailableFailureCopyWith<$Res> {
  _$ServiceUnavailableFailureCopyWithImpl(this._self, this._then);

  final ServiceUnavailableFailure _self;
  final $Res Function(ServiceUnavailableFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ServiceUnavailableFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class TimeoutFailure extends DioFailure {
  const TimeoutFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimeoutFailureCopyWith<TimeoutFailure> get copyWith =>
      _$TimeoutFailureCopyWithImpl<TimeoutFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimeoutFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.timeout(message: $message)';
  }
}

/// @nodoc
abstract mixin class $TimeoutFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $TimeoutFailureCopyWith(
          TimeoutFailure value, $Res Function(TimeoutFailure) _then) =
      _$TimeoutFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$TimeoutFailureCopyWithImpl<$Res>
    implements $TimeoutFailureCopyWith<$Res> {
  _$TimeoutFailureCopyWithImpl(this._self, this._then);

  final TimeoutFailure _self;
  final $Res Function(TimeoutFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(TimeoutFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UnknownServerErrorFailure extends DioFailure {
  const UnknownServerErrorFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnknownServerErrorFailureCopyWith<UnknownServerErrorFailure> get copyWith =>
      _$UnknownServerErrorFailureCopyWithImpl<UnknownServerErrorFailure>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnknownServerErrorFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.unknown(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UnknownServerErrorFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $UnknownServerErrorFailureCopyWith(UnknownServerErrorFailure value,
          $Res Function(UnknownServerErrorFailure) _then) =
      _$UnknownServerErrorFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UnknownServerErrorFailureCopyWithImpl<$Res>
    implements $UnknownServerErrorFailureCopyWith<$Res> {
  _$UnknownServerErrorFailureCopyWithImpl(this._self, this._then);

  final UnknownServerErrorFailure _self;
  final $Res Function(UnknownServerErrorFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UnknownServerErrorFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class NoInternetConnectionFailure extends DioFailure {
  const NoInternetConnectionFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NoInternetConnectionFailureCopyWith<NoInternetConnectionFailure>
      get copyWith => _$NoInternetConnectionFailureCopyWithImpl<
          NoInternetConnectionFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NoInternetConnectionFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.noInternetConnection(message: $message)';
  }
}

/// @nodoc
abstract mixin class $NoInternetConnectionFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $NoInternetConnectionFailureCopyWith(
          NoInternetConnectionFailure value,
          $Res Function(NoInternetConnectionFailure) _then) =
      _$NoInternetConnectionFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$NoInternetConnectionFailureCopyWithImpl<$Res>
    implements $NoInternetConnectionFailureCopyWith<$Res> {
  _$NoInternetConnectionFailureCopyWithImpl(this._self, this._then);

  final NoInternetConnectionFailure _self;
  final $Res Function(NoInternetConnectionFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(NoInternetConnectionFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class BadRequestFailure extends DioFailure {
  const BadRequestFailure(this.message) : super._();

  @override
  final String message;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BadRequestFailureCopyWith<BadRequestFailure> get copyWith =>
      _$BadRequestFailureCopyWithImpl<BadRequestFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BadRequestFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DioFailure.badRequest(message: $message)';
  }
}

/// @nodoc
abstract mixin class $BadRequestFailureCopyWith<$Res>
    implements $DioFailureCopyWith<$Res> {
  factory $BadRequestFailureCopyWith(
          BadRequestFailure value, $Res Function(BadRequestFailure) _then) =
      _$BadRequestFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$BadRequestFailureCopyWithImpl<$Res>
    implements $BadRequestFailureCopyWith<$Res> {
  _$BadRequestFailureCopyWithImpl(this._self, this._then);

  final BadRequestFailure _self;
  final $Res Function(BadRequestFailure) _then;

  /// Create a copy of DioFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(BadRequestFailure(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
