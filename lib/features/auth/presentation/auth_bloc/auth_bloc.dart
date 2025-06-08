import 'dart:async';
import 'dart:io';

//app dependencies
import 'package:chat_app/core/core.dart';
import 'package:chat_app/features/auth/domain/usecases/usecases.dart';

//external dependencies
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

//bloc parts
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ChangePasswordUsecase _changePasswordUsecase;
  final GetMeUsecase _getMeUsecase;
  final LoginUsecase _loginUsecase;
  final LogoutUsecase _logoutUsecase;
  final RegisterUsecase _registerUsecase;
  final UpdateProfilePictureUsecase _updateProfilePictureUsecase;
  final UpdateUserDataUsecase _updateUserDataUsecase;

  AuthBloc(
      this._changePasswordUsecase,
      this._getMeUsecase,
      this._loginUsecase,
      this._logoutUsecase,
      this._registerUsecase,
      this._updateProfilePictureUsecase,
      this._updateUserDataUsecase)
      : super(AuthState()) {
    on<AuthEvent>(_handleEvent);
  }

  StreamSubscription<int>? _timerSubscription;

  @override
  Future<void> close() async {
    await _timerSubscription?.cancel();
    return super.close();
  }

  Future<void> _handleEvent(AuthEvent event, Emitter<AuthState> emit) async =>
      switch (event) {
        _ChangeTimeDuration(:final timeDuration) =>
          _onChangeTimeDuration(emit, timeDuration),
        _ChangeRegistrationStatus(:final status) =>
          _onChangeRegistrationStatus(emit, registrationState: status),
        _Login(:final emailOrUsername, :final password) =>
          _onlogin(emit, emailOrUsername: emailOrUsername, password: password),
        _Register(
          :final email,
          :final password,
          :final firstName,
          :final lastName,
          :final username,
        ) =>
          _onRegister(emit,
              email: email,
              password: password,
              firstName: firstName,
              lastName: lastName,
              username: username),
        _GetMe() => _onGetMe(emit),
        _UpdateProfilePicture(file: final file) =>
          _onUpdateProfilePicture(emit, file: file),
        _UpdateUserData(
          username: final username,
          lastName: final lastName,
          firstName: final firstName,
          birthDate: final birthDate
        ) =>
          _onUpdateUserData(emit,
              username: username,
              firstName: firstName,
              lastName: lastName,
              birthDate: birthDate),
        _Logout() => _onLogout(emit),
        _ChangePassword(
          newPassword: final newPassword,
          oldPassword: final oldPassword
        ) =>
          _onChangePassword(emit, oldPassword, newPassword),
        AuthEvent() => () {},
      };

  Future<void> _startTimer(Emitter emit) async {
    throw UnimplementedError();
    // emit(state.copyWith(resetPassword: ResetPasswordStatus.waitingTimer));
    // await for (int i in _timerStream(60)) {
    //   add(AuthEvent.changeTimeDuration(timeDuration: i));
    // }
  }

  Stream<int> _timerStream(int durationInSecond) async* {
    for (int i = durationInSecond; i >= 0; i--) {
      yield i;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  void _onChangeTimeDuration(Emitter<AuthState> emit, int timeDuration) {
    throw UnimplementedError();
    // if (timeDuration == 0) {
    //   emit(state.copyWith(resetPassword: ResetPasswordStatus.tryAgain));
    // } else {
    //   emit(state.copyWith(timerDuration: timeDuration));
    // }
  }

  _onlogin(Emitter<AuthState> emit,
      {required String emailOrUsername, required String password}) async {
    emit(state.copyWith(status: StateStatus.loading));
    final failureOrSuccess = await _loginUsecase(
        LoginParams(emailOrUserName: emailOrUsername, password: password));
    failureOrSuccess.fold((failure) {
      emit(state.copyWith(status: StateStatus.error, message: failure.message));
    }, (message) {
      emit(state.copyWith(
          status: StateStatus.loaded,
          message: message,
          authState: AuthStatus.authorized));
    });
  }

  _onRegister(Emitter<AuthState> emit,
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String username}) async {
    emit(state.copyWith(status: StateStatus.loading));

    final failureOrSuccess = await _registerUsecase(
      RegisterParams(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          username: username),
    );

    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          message: failure.message,
          registrationState: RegistrationState.emailInput,
        ));
      },
      (message) => emit(state.copyWith(
          authState: AuthStatus.authorized,
          status: StateStatus.loaded,
          message: message)),
    );
  }

  _onGetMe(Emitter<AuthState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));
    final failureOrSuccess = await _getMeUsecase(NoParams());
    failureOrSuccess.fold((failure) {
      if (failure is UnauthorizedFailure) {
        emit(state.copyWith(
            status: StateStatus.error,
            message: failure.message,
            authState: AuthStatus.notAuthorized));
      } else {
        emit(state.copyWith(
            status: StateStatus.error, message: failure.message));
      }
    }, (user) {
      emit(state.copyWith(currentUser: user, status: StateStatus.loaded));
    });
  }

  _onUpdateProfilePicture(Emitter<AuthState> emit, {File? file}) async {
    emit(state.copyWith(status: StateStatus.loading));
    if (file != null) {
      final failureOrSuccess = await _updateProfilePictureUsecase(file);
      failureOrSuccess.fold((failure) {
        if (failure is UnauthorizedFailure) {
          emit(state.copyWith(
              status: StateStatus.error,
              message: failure.message,
              authState: AuthStatus.notAuthorized));
        } else {
          emit(state.copyWith(
              status: StateStatus.error, message: failure.message));
        }
      }, (message) {
        emit(state.copyWith(message: message, status: StateStatus.loaded));
      });
    } else {
      emit(state.copyWith(
          status: StateStatus.error,
          message: 'No file selected for profile picture.'));
    }
  }

  _onUpdateUserData(Emitter<AuthState> emit,
      {required String? username,
      required String? lastName,
      required String? firstName,
      required String? birthDate}) async {
    emit(state.copyWith(status: StateStatus.loading));
    final failureOrSuccess = await _updateUserDataUsecase(UpdateProfileParams(
      username: username,
      firstName: firstName,
      lastName: lastName,
      birthDate: birthDate,
    ));
    failureOrSuccess.fold((failure) {
      if (failure is UnauthorizedFailure) {
        emit(state.copyWith(
            status: StateStatus.error,
            message: failure.message,
            authState: AuthStatus.notAuthorized));
      } else {
        emit(state.copyWith(
            status: StateStatus.error, message: failure.message));
      }
    }, (message) {
      emit(state.copyWith(message: message, status: StateStatus.loaded));
    });
  }

  _onLogout(Emitter<AuthState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));
    final failureOrSuccess = await _logoutUsecase(NoParams());
    failureOrSuccess.fold((failure) {
      if (failure is UnauthorizedFailure) {
        emit(state.copyWith(
            status: StateStatus.error,
            message: failure.message,
            authState: AuthStatus.notAuthorized));
      } else {
        emit(state.copyWith(
            status: StateStatus.error, message: failure.message));
      }
    }, (message) {
      emit(state.copyWith(message: message, status: StateStatus.loaded));
    });
  }

  _onChangePassword(
      Emitter<AuthState> emit, String oldPassword, String newPassword) async {
    emit(state.copyWith(status: StateStatus.loading));
    final failureOrSuccess = await _changePasswordUsecase(
        ChangeUserPasswordParams(
            newPassword: newPassword, oldPassword: oldPassword));
    failureOrSuccess.fold((failure) {
      if (failure is UnauthorizedFailure) {
        emit(state.copyWith(
            status: StateStatus.error,
            message: failure.message,
            authState: AuthStatus.notAuthorized));
      } else {
        emit(state.copyWith(
            status: StateStatus.error, message: failure.message));
      }
    }, (message) {
      emit(state.copyWith(message: message, status: StateStatus.loaded));
    });
  }

  _onChangeRegistrationStatus(Emitter<AuthState> emit,
      {required RegistrationState registrationState}) {
    emit(state.copyWith(registrationState: registrationState));
  }
}
