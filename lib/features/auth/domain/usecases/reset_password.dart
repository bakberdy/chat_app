import 'package:chat_app/core/usecase/usecase.dart';
import 'package:chat_app/core/utils/utils.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetPassword extends Usecase<void, String> {
  final AuthRepository repository;

  ResetPassword(this.repository);
  @override
  ResultFuture<void> call(String p) {
    return repository.resetPassword(p);
  }
}
