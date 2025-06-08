
import 'package:chat_app/core/error/exception.dart';

abstract class Failure {
  String get message;
  const Failure();
}

class UnknownFailure extends Failure{
  final String _message;

  UnknownFailure(this._message);
  @override
  String get message => _message;
}

class TokenFailure extends Failure{
  final String _message;

  TokenFailure(this._message);
  @override
  String get message => _message;
  factory TokenFailure.fromTokenException(TokenException e){
    return TokenFailure(e.message);
  }

}
