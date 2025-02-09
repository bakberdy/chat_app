import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpInputState> {
  SignUpCubit() : super(SignUpInputInitial());

  void addNameAndLastname() {
    emit(SignUpInputNameAndLastnameSuccess());
  }

  void addEmailAndPassword() {
    emit(SignUpInputEmailAndPasswordSuccess());
  }
}
