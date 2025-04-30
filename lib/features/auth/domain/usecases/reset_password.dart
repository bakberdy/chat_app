import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';



@singleton
class ResetPassword extends Usecase<void, String> {
  final AuthRepository repository;

  ResetPassword(this.repository);
  @override
  ResultFuture<void> call(String p) {
    return repository.resetPassword(p);
  }
}
