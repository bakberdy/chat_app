import 'package:chat_app/features/auth/domain/usecases/reset_password.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_apple.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:chat_app/features/auth/domain/usecases/sign_up_with_email.dart';
import 'package:mocktail/mocktail.dart';

class MockResetPassword extends Mock implements ResetPassword {}
class MockSignInWithEmail extends Mock implements SignInWithEmail {}
class MockSignUpWithEmail extends Mock implements SignUpWithEmail {}
class MockSignInWithApple extends Mock implements SignInWithAppleUseCase {}
class MockSignInWithGoogle extends Mock implements SignInWithGoogle {}