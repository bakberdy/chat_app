import 'package:chat_app/core/error/exception.dart';
import 'package:chat_app/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

void main() {
  late final SupabaseClient client;
  late final AuthSupabaseDataSourceImpl dataSourceImpl;

  setUp(() {
    client = MockSupabaseClient();
    dataSourceImpl = AuthSupabaseDataSourceImpl(client);
  });

  group('reset password', () {
    test(
        'should complete successfully when [SupabaseClient.resetPassword] is success',
        () async {
      // arrange
      when(() => client.auth.resetPasswordForEmail('email'))
          .thenAnswer((_) async => Future.value());
    
      // act
      final result = dataSourceImpl.resetPassword('email');

      // assert
      await expectLater(result, completes);
      verify(() => client.auth.resetPasswordForEmail('email')).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw an error when [SupabaseClient.resetPassword] fails',
        () async {
      // Arrange
      when(() => client.auth.resetPasswordForEmail('email'))
          .thenThrow(UnknownException('Reset password failed'));

      // Act & Assert
      expect(() => dataSourceImpl.resetPassword('email'),
          throwsA(isA<Exception>()));
    });
  });
}
