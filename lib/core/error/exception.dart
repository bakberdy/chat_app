import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  final String message;
  const AppException(this.message);
  @override
  List<Object?> get props => [message];
}

// class AuthException extends AppException {
//   const AuthException(super.message);
// }

class NetworkConnectionException extends AppException {
  const NetworkConnectionException(super.message);
}

class UnknownException extends AppException {
  const UnknownException(super.message);
}

class ServerException extends AppException {
  const ServerException(super.message, [this.code]);
  final int? code;

  @override
  List<Object?> get props => [message, code];
}

class TimeoutException extends AppException {
  const TimeoutException(super.message, [this.code]);
  final int? code;

  @override
  List<Object?> get props => [message, code];
}
