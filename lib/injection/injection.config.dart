// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../core/auth/auth_listener.dart' as _i900;
import '../core/auth/auth_service.dart' as _i542;
import '../features/auth/data/datasource/auth_remote_data_source.dart' as _i342;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i920;
import '../features/auth/domain/repository/auth_repository.dart' as _i267;
import '../features/auth/domain/usecases/reset_password.dart' as _i73;
import '../features/auth/domain/usecases/sign_in_with_apple.dart' as _i538;
import '../features/auth/domain/usecases/sign_in_with_email.dart' as _i33;
import '../features/auth/domain/usecases/sign_in_with_google.dart' as _i345;
import '../features/auth/domain/usecases/sign_up_with_email.dart' as _i588;
import '../features/auth/presentation/bloc/auth_bloc.dart' as _i59;
import '../features/users/presentation/blocs/users_bloc/users_bloc.dart'
    as _i900;
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
    gh.factory<_i900.UsersBloc>(() => _i900.UsersBloc());
    gh.singleton<_i454.SupabaseClient>(() => appModule.supabaseClient);
    gh.singleton<_i116.GoogleSignIn>(() => appModule.googleSignIn);
    gh.singleton<_i542.AuthService>(
        () => _i542.AuthService(gh<_i454.SupabaseClient>()));
    gh.singleton<_i900.AuthListener>(
        () => _i900.AuthListener(gh<_i542.AuthService>()));
    gh.singleton<_i342.AuthRemoteDataSource>(
        () => _i342.AuthSupabaseDataSourceImpl(
              gh<_i454.SupabaseClient>(),
              gh<_i116.GoogleSignIn>(),
            ));
    gh.singleton<_i267.AuthRepository>(
        () => _i920.AuthRepositoryImpl(gh<_i342.AuthRemoteDataSource>()));
    gh.singleton<_i73.ResetPassword>(
        () => _i73.ResetPassword(gh<_i267.AuthRepository>()));
    gh.singleton<_i538.SignInWithAppleUseCase>(
        () => _i538.SignInWithAppleUseCase(gh<_i267.AuthRepository>()));
    gh.singleton<_i33.SignInWithEmail>(
        () => _i33.SignInWithEmail(gh<_i267.AuthRepository>()));
    gh.singleton<_i345.SignInWithGoogle>(
        () => _i345.SignInWithGoogle(gh<_i267.AuthRepository>()));
    gh.singleton<_i588.SignUpWithEmail>(
        () => _i588.SignUpWithEmail(gh<_i267.AuthRepository>()));
    gh.factory<_i59.AuthBloc>(() => _i59.AuthBloc(
          gh<_i73.ResetPassword>(),
          gh<_i33.SignInWithEmail>(),
          gh<_i588.SignUpWithEmail>(),
          gh<_i538.SignInWithAppleUseCase>(),
          gh<_i345.SignInWithGoogle>(),
        ));
    return this;
  }
}

class _$AppModule extends _i464.AppModule {}
