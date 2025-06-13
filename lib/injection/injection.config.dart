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
    gh.singleton<_i156.AppRouter>(() => appModule.appRouter);
    gh.singleton<_i393.DioClient>(() => _i393.DioClient(
          gh<_i361.Dio>(),
          gh<_i162.TalkerDioLogger>(),
        ));
    return this;
  }
}

class _$AppModule extends _i464.AppModule {}
