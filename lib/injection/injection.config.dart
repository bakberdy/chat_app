// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_bloc/flutter_bloc.dart' as _i331;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart' as _i162;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

import '../core/core.dart' as _i156;
import '../core/network/dio_client.dart' as _i393;
import '../features/auth/data/datasource/local/token_secure_storage_impl.dart'
    as _i652;
import '../features/auth/data/datasource/remote/auth_remote_data_source.dart'
    as _i723;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i920;
import '../features/auth/domain/repository/auth_repository.dart' as _i267;
import '../features/auth/domain/usecases/change_password_usecase.dart' as _i59;
import '../features/auth/domain/usecases/get_me_usecase.dart' as _i446;
import '../features/auth/domain/usecases/login_usecase.dart' as _i406;
import '../features/auth/domain/usecases/logout_usecase.dart' as _i11;
import '../features/auth/domain/usecases/register_usecase.dart' as _i819;
import '../features/auth/domain/usecases/reset_password_usecase.dart' as _i685;
import '../features/auth/domain/usecases/update_profile_picture_usecase.dart'
    as _i957;
import '../features/auth/domain/usecases/update_user_data_usecase.dart'
    as _i599;
import '../features/auth/domain/usecases/usecases.dart' as _i11;
import '../features/auth/presentation/auth_bloc/auth_bloc.dart' as _i186;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i116.GoogleSignIn>(() => appModule.googleSignIn);
    gh.singleton<_i207.Talker>(() => appModule.talker);
    gh.singleton<_i331.BlocObserver>(() => appModule.talkerBlocLogger);
    gh.singleton<_i207.TalkerRouteObserver>(() => appModule.routeObserver);
    gh.singleton<_i361.Dio>(() => appModule.dio);
    gh.singleton<_i162.TalkerDioLogger>(() => appModule.talkerDioLogger);
    gh.singleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.singleton<_i156.TokenStorage>(() => _i652.TokenSecureStorageImpl(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i207.Talker>(),
        ));
    gh.singleton<_i393.DioClient>(() => _i393.DioClient(
          gh<_i361.Dio>(),
          gh<_i156.TokenStorage>(),
          gh<_i162.TalkerDioLogger>(),
        ));
    gh.singleton<_i723.AuthRemoteDataSource>(
        () => _i723.AuthRemoteDataSourceImpl(gh<_i156.DioClient>()));
    gh.singleton<_i267.AuthRepository>(() => _i920.AuthRepositoryImpl(
          gh<_i723.AuthRemoteDataSource>(),
          gh<_i156.TokenStorage>(),
        ));
    gh.lazySingleton<_i599.UpdateUserDataUsecase>(
        () => _i599.UpdateUserDataUsecase(gh<_i267.AuthRepository>()));
    gh.lazySingleton<_i819.RegisterUsecase>(
        () => _i819.RegisterUsecase(gh<_i267.AuthRepository>()));
    gh.lazySingleton<_i406.LoginUsecase>(
        () => _i406.LoginUsecase(gh<_i267.AuthRepository>()));
    gh.lazySingleton<_i11.LogoutUsecase>(
        () => _i11.LogoutUsecase(gh<_i267.AuthRepository>()));
    gh.lazySingleton<_i957.UpdateProfilePictureUsecase>(
        () => _i957.UpdateProfilePictureUsecase(gh<_i267.AuthRepository>()));
    gh.lazySingleton<_i59.ChangePasswordUsecase>(
        () => _i59.ChangePasswordUsecase(gh<_i267.AuthRepository>()));
    gh.lazySingleton<_i685.ResetPasswordUsecase>(
        () => _i685.ResetPasswordUsecase(gh<_i267.AuthRepository>()));
    gh.lazySingleton<_i446.GetMeUsecase>(
        () => _i446.GetMeUsecase(gh<_i267.AuthRepository>()));
    gh.singleton<_i186.AuthBloc>(() => _i186.AuthBloc(
          gh<_i685.ResetPasswordUsecase>(),
          gh<_i11.ChangePasswordUsecase>(),
          gh<_i11.GetMeUsecase>(),
          gh<_i11.LoginUsecase>(),
          gh<_i11.LogoutUsecase>(),
          gh<_i11.RegisterUsecase>(),
          gh<_i11.UpdateProfilePictureUsecase>(),
          gh<_i11.UpdateUserDataUsecase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i464.AppModule {}
