import 'exception.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
  @override
  List<Object?> get props => [message];

  factory Failure.fromAppException(AppException e) {
    if (e is NetworkConnectionException) {
      return NetworkConnectionFailure(e.message);
    } else if (e is ServerException) {
      return ServerFailure(e.message);
    } else if (e is TimeoutException) {
      return TimeoutFailure(e.message);
      // } else if (e is AuthException) {
      //   return AuthFailure(e.message);
    } else {
      return UnknownFailure(e.message);
    }
  }
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, [this.code]);
  final int? code;

  @override
  List<Object?> get props => [message, code];
}

class NetworkConnectionFailure extends Failure {
  const NetworkConnectionFailure(super.message);
}
