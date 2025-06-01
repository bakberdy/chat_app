import 'package:chat_app/core/utils/utils.dart';

abstract class Usecase<T, P> {
  ResultFuture<T> call(P params);
}

class NoParams {}
