import 'dart:async';

//app dependencies
import 'package:chat_app/core/bloc/bloc.dart';
import 'package:chat_app/core/usecase/usecase.dart';
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
  final ResetPassword _resetPassword;
  final SignInWithEmail _signInWithEmail;
  final SignUpWithEmail _signUpWithEmail;
  final SignInWithAppleUseCase _signInWithApple;
  final SignInWithGoogle _signInWithGoogle;

  AuthBloc(
    this._resetPassword,
    this._signInWithEmail,
    this._signUpWithEmail,
    this._signInWithApple,
    this._signInWithGoogle,
  ) : super(AuthState()) {
    on<AuthEvent>(_handleEvent);
  }

  StreamSubscription<int>? _timerSubscription;

  @override
  Future<void> close() async {
    await _timerSubscription?.cancel();
    return super.close();
  }

  Future<void> _onSignIn(Emitter emit,
      {required String email, required String password}) async {
    emit(state.copyWith(signInStatus: StateStatus.loading));

    final failureOrSuccess =
        await _signInWithEmail(SignInParams(email: email, password: password));

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(
        signInStatus: StateStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(signInStatus: StateStatus.loaded)),
    );
  }

  Future<void> _onChangeSignUpStatus(Emitter emit,
      {required SignUpStatus status}) async {
    emit(state.copyWith(signUpStatus: status));
  }

  Future<void> _onSignUp(
    Emitter<AuthState> emit, {
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(state.copyWith(signUpStatus: SignUpStatus.loading));

    final failureOrSuccess = await _signUpWithEmail(SignUpParams(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName));

    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
            signUpStatus: SignUpStatus.error, errorMessage: failure.message));
        emit(state.copyWith(signUpStatus: SignUpStatus.nameGot));
      },
      (_) => emit(state.copyWith(signUpStatus: SignUpStatus.success)),
    );
  }

  Future<void> _onSendResetCode(Emitter<AuthState> emit,
      {required String email}) async {
    emit(state.copyWith(resetPassword: ResetPasswordStatus.loading));

    final failureOrSuccess = await _resetPassword(email);

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(
        resetPassword: ResetPasswordStatus.error,
        errorMessage: failure.message,
      )),
      (_) async {
        await _startTimer(emit);
      },
    );
  }

  Future<void> _onAppleSignIn(Emitter<AuthState> emit) async {
    emit(state.copyWith(signInStatus: StateStatus.loading));

    final failureOrSuccess = await _signInWithApple(NoParams());

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(
        signInStatus: StateStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(signInStatus: StateStatus.loaded)),
    );
  }

  Future<void> _onGoogleSignIn(Emitter<AuthState> emit) async {
    emit(state.copyWith(signInStatus: StateStatus.loading));

    final failureOrSuccess = await _signInWithGoogle(NoParams());

    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(
        signInStatus: StateStatus.error,
        errorMessage: failure.message,
      )),
      (_) => emit(state.copyWith(signInStatus: StateStatus.loaded)),
    );
  }

  Future<void> _handleEvent(AuthEvent event, Emitter<AuthState> emit) async {
    switch (event) {
      case _SignIn(:final email, :final password):
        return await _onSignIn(emit, email: email, password: password);
      case _ChangeSignUpStatus(:final status):
        return await _onChangeSignUpStatus(emit, status: status);
      case _SignUp(
          :final email,
          :final password,
          :final firstName,
          :final lastName
        ):
        return await _onSignUp(emit,
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName);
      case _SendResetMessageToEmail(:final email):
        return await _onSendResetCode(emit, email: email);

      case _AppleSignIn():
        return await _onAppleSignIn(emit);
      case _GoogleSignIn():
        return await _onGoogleSignIn(emit);
      case _ChangeTimeDuration(:final timeDuration):
        return _onChangeTimeDuration(emit, timeDuration);
    }
  }

  Future<void> _startTimer(Emitter emit) async {
    emit(state.copyWith(resetPassword: ResetPasswordStatus.waitingTimer));
    await for (int i in _timerStream(60)) {
      add(AuthEvent.changeTimeDuration(timeDuration: i));
    }
  }

  Stream<int> _timerStream(int durationInSecond) async* {
    for (int i = durationInSecond; i >= 0; i--) {
      yield i;
      await Future.delayed(Duration(seconds: 1));
    }
  }

  void _onChangeTimeDuration(Emitter<AuthState> emit, int timeDuration) {
    if (timeDuration == 0) {
      emit(state.copyWith(resetPassword: ResetPasswordStatus.tryAgain));
    } else {
      emit(state.copyWith(timerDuration: timeDuration));
    }
  }
}
