import 'package:chat_app/features/auth/domain/enitities/sign_up_with_email_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void addNameAndLastname() {
    emit(SignUpNameGot());
  }

  void register(SignUpWithEmailEntity signUpParams) async {
    emit(SignUpLoading());
    await Future.delayed(Duration(seconds: 2));
    print(signUpParams.toString());
    emit(SignUpSuccess());
  }
}
