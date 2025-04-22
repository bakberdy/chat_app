import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void addNameAndLastname() {
    emit(SignUpNameGot());
  }

  void signUpWithEmailAndPassword() {
    emit(SignUpSuccess());
  }
}
