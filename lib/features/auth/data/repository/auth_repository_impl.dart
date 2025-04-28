import 'package:chat_app/core/error/exception.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/utils/typedef.dart';
import 'package:chat_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chat_app/features/auth/data/models/sign_in_with_email_model.dart';
import 'package:chat_app/features/auth/data/models/sign_up_with_email_model.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_in_with_email_entity.dart';
import 'package:chat_app/features/auth/domain/enitities/sign_up_with_email_entity.dart';
import 'package:chat_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

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
  ResultVoid signInWithEmail(SignInWithEmailEntity signInParams) async {
    try {
      await authRemoteDataSource
          .signInWithEmail(SignInWithEmailModel.fromEntity(signInParams));
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
  ResultVoid signUpWithEmail(SignUpWithEmailEntity signUpParams) async {
    try {
      await authRemoteDataSource
          .signUpWithEmail(SignUpWithEmailModel.fromEntity(signUpParams));
      return Right(null);
    } on AppException catch (e) {
      return Left(Failure.fromAppException(e));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
