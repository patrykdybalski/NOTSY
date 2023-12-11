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

  final userDataTest = ['abc@gmail.com', 'abc111'];

  group('createUser', () {
    test('should call _loginAuthDataSource.createUserAccount() method',
        () async {
      when(() => dataSource.createUserAccount(
            email: userDataTest[0],
            password: userDataTest[1],
          )).thenAnswer((_) async => []);

      await sut.createUser(
        email: userDataTest[0],
        password: userDataTest[1],
      );

      verify(() => dataSource.createUserAccount(
            email: userDataTest[0],
            password: userDataTest[1],
          )).called(1);
    });
  });

  group('signInUser', () {
    test('should call _loginAuthDataSource.signIn() method', () async {
      when(() => dataSource.signIn(
            email: userDataTest[0],
            password: userDataTest[1],
          )).thenAnswer((_) async => []);

      await sut.signInUser(
        email: userDataTest[0],
        password: userDataTest[1],
      );

      verify(() => dataSource.signIn(
            email: userDataTest[0],
            password: userDataTest[1],
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
            email: userDataTest[0],
          )).thenAnswer((_) async => []);

      await sut.resetPassword(
        email: userDataTest[0],
      );

      verify(() => dataSource.passwordResetData(
            email: userDataTest[0],
          )).called(1);
    });
  });
}
