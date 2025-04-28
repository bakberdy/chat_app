// // dart format width=80
// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'profile_bloc.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// // dart format off
// T _$identity<T>(T value) => value;

// /// @nodoc
// mixin _$ProfileEvent {
//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is ProfileEvent);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   String toString() {
//     return 'ProfileEvent()';
//   }
// }

// /// @nodoc
// class $ProfileEventCopyWith<$Res> {
//   $ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
// }

// /// @nodoc

// class ProfileFetch implements ProfileEvent {
//   const ProfileFetch();

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType && other is ProfileFetch);
//   }

//   @override
//   int get hashCode => runtimeType.hashCode;

//   @override
//   String toString() {
//     return 'ProfileEvent.fetch()';
//   }
// }

// /// @nodoc
// mixin _$ProfileState {
//   StateStatus get status;
//   UserEntity? get user;

//   /// Create a copy of ProfileState
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @pragma('vm:prefer-inline')
//   $ProfileStateCopyWith<ProfileState> get copyWith =>
//       _$ProfileStateCopyWithImpl<ProfileState>(
//           this as ProfileState, _$identity);

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is ProfileState &&
//             (identical(other.status, status) || other.status == status) &&
//             (identical(other.user, user) || other.user == user));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, status, user);

//   @override
//   String toString() {
//     return 'ProfileState(status: $status, user: $user)';
//   }
// }

// /// @nodoc
// abstract mixin class $ProfileStateCopyWith<$Res> {
//   factory $ProfileStateCopyWith(
//           ProfileState value, $Res Function(ProfileState) _then) =
//       _$ProfileStateCopyWithImpl;
//   @useResult
//   $Res call({StateStatus status, UserEntity? user});
// }

// /// @nodoc
// class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
//   _$ProfileStateCopyWithImpl(this._self, this._then);

//   final ProfileState _self;
//   final $Res Function(ProfileState) _then;

//   /// Create a copy of ProfileState
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? status = null,
//     Object? user = freezed,
//   }) {
//     return _then(_self.copyWith(
//       status: null == status
//           ? _self.status
//           : status // ignore: cast_nullable_to_non_nullable
//               as StateStatus,
//       user: freezed == user
//           ? _self.user
//           : user // ignore: cast_nullable_to_non_nullable
//               as UserEntity?,
//     ));
//   }
// }

// /// @nodoc

// class _ProfileState implements ProfileState {
//   const _ProfileState({this.status = StateStatus.initial, this.user});

//   @override
//   @JsonKey()
//   final StateStatus status;
//   @override
//   final UserEntity? user;

//   /// Create a copy of ProfileState
//   /// with the given fields replaced by the non-null parameter values.
//   @override
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @pragma('vm:prefer-inline')
//   _$ProfileStateCopyWith<_ProfileState> get copyWith =>
//       __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _ProfileState &&
//             (identical(other.status, status) || other.status == status) &&
//             (identical(other.user, user) || other.user == user));
//   }

//   @override
//   int get hashCode => Object.hash(runtimeType, status, user);

//   @override
//   String toString() {
//     return 'ProfileState(status: $status, user: $user)';
//   }
// }

// /// @nodoc
// abstract mixin class _$ProfileStateCopyWith<$Res>
//     implements $ProfileStateCopyWith<$Res> {
//   factory _$ProfileStateCopyWith(
//           _ProfileState value, $Res Function(_ProfileState) _then) =
//       __$ProfileStateCopyWithImpl;
//   @override
//   @useResult
//   $Res call({StateStatus status, UserEntity? user});
// }

// /// @nodoc
// class __$ProfileStateCopyWithImpl<$Res>
//     implements _$ProfileStateCopyWith<$Res> {
//   __$ProfileStateCopyWithImpl(this._self, this._then);

//   final _ProfileState _self;
//   final $Res Function(_ProfileState) _then;

//   /// Create a copy of ProfileState
//   /// with the given fields replaced by the non-null parameter values.
//   @override
//   @pragma('vm:prefer-inline')
//   $Res call({
//     Object? status = null,
//     Object? user = freezed,
//   }) {
//     return _then(_ProfileState(
//       status: null == status
//           ? _self.status
//           : status // ignore: cast_nullable_to_non_nullable
//               as StateStatus,
//       user: freezed == user
//           ? _self.user
//           : user // ignore: cast_nullable_to_non_nullable
//               as UserEntity?,
//     ));
//   }
// }

// // dart format on
