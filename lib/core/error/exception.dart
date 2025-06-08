
abstract class AppException implements Exception {
   String get message;
  const AppException();
}

class ParsingDataException extends AppException {
  @override
  final String message;

  const ParsingDataException(this.message);

  @override
  String toString() => 'ParsingDataException: $message';
}

class TokenException extends AppException{
  final String _message;

  TokenException(this._message);
  @override
  String get message => _message;

}