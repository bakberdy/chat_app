//app dependencies
import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';

//external dependencies
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  ResultVoid resetPassword(String email) async {
    try {
      await authRemoteDataSource.resetPassword(email);
      return Right(null);
    } on AppException catch (e) {
      return Left(Failure.fromAppException(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultVoid signInWithApple() async {
    try {
      await authRemoteDataSource.signInWithApple();
      return Right(null);
    } on AppException catch (e) {
      return Left(Failure.fromAppException(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultVoid signInWithEmail(
      {required String email, required String password}) async {
    try {
      await authRemoteDataSource.signInWithEmail(
          email: email, password: password);
      return Right(null);
    } on AppException catch (e) {
      return Left(Failure.fromAppException(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultVoid signInWithGoogle() async {
    try {
      await authRemoteDataSource.signInWithGoogle();
      return Right(null);
    } on AppException catch (e) {
      return Left(Failure.fromAppException(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultVoid signUpWithEmail(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      await authRemoteDataSource.signUpWithEmail(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);
      return Right(null);
    } on AppException catch (e) {
      return Left(Failure.fromAppException(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
