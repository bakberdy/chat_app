import 'package:chat_app/core/utils/typedef.dart';

abstract class Usecase<T, P> {
  ResultFuture<T> call(P params);
}

class NoParams {}
