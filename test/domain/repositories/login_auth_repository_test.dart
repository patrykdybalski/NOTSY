import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/data/remote_data_sources_firebase/login_auth_data_source.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';

class MockLoginAuthDataSource extends Mock implements LoginAuthDataSource {}

void main() {
  late LoginAuthRepository sut;
  late MockLoginAuthDataSource dataSource;

  setUp(() {
    dataSource = MockLoginAuthDataSource();
    sut = LoginAuthRepository(dataSource);
  });

  group('createUser', () {
    test('should call _loginAuthDataSource.createUserAccount() method',
        () async {
      when(() => dataSource.createUserAccount(
            email: 'abc@gmail.com',
            password: '111',
          )).thenAnswer((_) async => []);

      await sut.createUser(
        email: 'abc@gmail.com',
        password: '111',
      );

      verify(() => dataSource.createUserAccount(
            email: 'abc@gmail.com',
            password: '111',
          )).called(1);
    });
  });

  group('signInUser', () {
    test('should call _loginAuthDataSource.signIn() method', () async {
      when(() => dataSource.signIn(
            email: 'abc@gmail.com',
            password: '111',
          )).thenAnswer((_) async => []);

      await sut.signInUser(
        email: 'abc@gmail.com',
        password: '111',
      );

      verify(() => dataSource.signIn(
            email: 'abc@gmail.com',
            password: '111',
          )).called(1);
    });
  });

  group('signOut', () {
    test('should call _loginAuthDataSource.signOut() method', () async {
      when(() => dataSource.signOut()).thenAnswer((_) async => []);

      await sut.signOut();

      verify(() => dataSource.signOut()).called(1);
    });
  });

  group('resetPassword', () {
    test('should call _loginAuthDataSource.passwordResetData() method',
        () async {
      when(() => dataSource.passwordResetData(
            email: 'abc@gmail.com',
          )).thenAnswer((_) async => []);

      await sut.resetPassword(email: 'abc@gmail.com');

      verify(() => dataSource.passwordResetData(
            email: 'abc@gmail.com',
          )).called(1);
    });
  });
}
