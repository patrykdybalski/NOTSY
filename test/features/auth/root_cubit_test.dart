import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/root_page/cubit/root_cubit.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';

class MockLoginAuthRepository extends Mock implements LoginAuthRepository {}

void main() {
  late RootCubit sut;
  late MockLoginAuthRepository repository;

  setUp(() {
    repository = MockLoginAuthRepository();
    sut = RootCubit(repository);
  });

  final testError = Exception('error');
  const testErrorMessage = 'Exception: error';

  group('start', () {
    group('success', () {
      setUp(() {
        when(() => repository.start()).thenAnswer((_) => Stream.value(null));
      });

      blocTest<RootCubit, RootState>(
        'emit Status.loading then Status.success with user',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          RootState(status: Status.loading),
          RootState(user: null, status: Status.success),
        ],
      );
    });

    group('failure', () {
      setUp(() {
        when(() => repository.start()).thenThrow(testError);
      });

      blocTest<RootCubit, RootState>(
        'emit Status.loading then Status.error with error messag',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          RootState(
            status: Status.loading,
            user: null,
          ),
          RootState(
            errorMessage: testErrorMessage,
            status: Status.error,
          ),
        ],
      );
    });
  });
}
