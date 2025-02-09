part of 'sign_up_cubit.dart';

sealed class SignUpInputState {}

final class SignUpInputInitial extends SignUpInputState {}
final class SignUpInputEmailAndPasswordSuccess extends SignUpInputState{}
final class SignUpInputNameAndLastnameSuccess extends SignUpInputState{}

