import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';

class MockLoginAuthRepository extends Mock implements LoginAuthRepository {}

void main() {
  late AuthCubit sut;
  late MockLoginAuthRepository repository;

  setUp(() {
    repository = MockLoginAuthRepository();
    sut = AuthCubit(repository);
  });

  const emailTest = 'emailTest1';
  const passwordTest = 'passwordTest1';
  final testError = Exception('error');
  const testErrorMessage = 'Exception: error';

  group('signIn', () {
    group('succes', () {
      setUp(() {
        when(() => repository.signInUser(
              email: emailTest,
              password: passwordTest,
            )).thenAnswer((_) async => []);
      });
      blocTest<AuthCubit, AuthState>(
        'emits saved: true',
        build: () => sut,
        act: (cubit) => cubit.signIn(
          email: emailTest,
          password: passwordTest,
        ),
        expect: () => [
          AuthState(saved: true),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.signInUser(
              email: emailTest,
              password: passwordTest,
            )).thenThrow(testError);
      });
      blocTest<AuthCubit, AuthState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.signIn(
          email: emailTest,
          password: passwordTest,
        ),
        expect: () => [
          AuthState(errorMessage: testErrorMessage),
        ],
      );
    });
  });

  group('signOut', () {
    group('succes', () {
      setUp(() {
        when(() => repository.signOut()).thenAnswer((_) async => []);
      });
      blocTest<AuthCubit, AuthState>(
        'emits saved: true',
        build: () => sut,
        act: (cubit) => cubit.signOut(),
        expect: () => [
          AuthState(saved: true),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.signOut()).thenThrow(testError);
      });
      blocTest<AuthCubit, AuthState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.signOut(),
        expect: () => [
          AuthState(errorMessage: testErrorMessage),
        ],
      );
    });
  });

  group('createUserAccount', () {
    group('succes', () {
      setUp(() {
        when(() => repository.createUser(
              email: emailTest,
              password: passwordTest,
            )).thenAnswer((_) async => []);
      });
      blocTest<AuthCubit, AuthState>(
        'emits saved: true',
        build: () => sut,
        act: (cubit) => cubit.createUserAccount(
          email: emailTest,
          password: passwordTest,
        ),
        expect: () => [
          AuthState(saved: true),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.createUser(
              email: emailTest,
              password: passwordTest,
            )).thenThrow(testError);
      });
      blocTest<AuthCubit, AuthState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.createUserAccount(
          email: emailTest,
          password: passwordTest,
        ),
        expect: () => [
          AuthState(errorMessage: testErrorMessage),
        ],
      );
    });
  });

  group('resetPasswordd', () {
    group('succes', () {
      setUp(() {
        when(() => repository.resetPassword(
              email: emailTest,
            )).thenAnswer((_) async => []);
      });
      blocTest<AuthCubit, AuthState>(
        'emits saved: true',
        build: () => sut,
        act: (cubit) => cubit.resetPasswordd(
          email: emailTest,
        ),
        expect: () => [
          AuthState(saved: true),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.resetPassword(
              email: emailTest,
            )).thenThrow(testError);
      });
      blocTest<AuthCubit, AuthState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.resetPasswordd(
          email: emailTest,
        ),
        expect: () => [
          AuthState(errorMessage: testErrorMessage),
        ],
      );
    });
  });
}
