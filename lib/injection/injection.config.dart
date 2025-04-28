// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/auth/auth_listener.dart' as _i900;
import '../core/auth/auth_service.dart' as _i542;
import '../features/auth/presentation/blocs/reset_password/reset_password_cubit.dart'
    as _i687;
import '../features/auth/presentation/blocs/sign_in/sign_in_cubit.dart'
    as _i465;
import '../features/auth/presentation/blocs/sign_up/sign_up_cubit.dart'
    as _i341;
import '../features/settings/profile/presentation/bloc/profile/profile_bloc.dart'
    as _i717;
import '../features/users/presentation/blocs/users_bloc/users_bloc.dart'
    as _i900;

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
    gh.factory<_i687.ResetPasswordCubit>(() => _i687.ResetPasswordCubit());
    gh.factory<_i465.SignInCubit>(() => _i465.SignInCubit());
    gh.factory<_i341.SignUpCubit>(() => _i341.SignUpCubit());
    // gh.factory<_i717.ProfileBloc>(() => _i717.ProfileBloc());
    gh.singleton<_i542.AuthService>(() => _i542.AuthService());
    gh.singleton<_i900.UsersBloc>(() => _i900.UsersBloc());
    gh.singleton<_i900.AuthListener>(
        () => _i900.AuthListener(gh<_i542.AuthService>()));
    return this;
  }
}
