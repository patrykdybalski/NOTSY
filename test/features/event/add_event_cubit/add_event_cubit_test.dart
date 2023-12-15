import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/domain/repositories/event/event_repository.dart';
import 'package:primary_school/features/home/pages/event_page/screens/add_event_dialog/cubit/add_event_cubit.dart';

class MockEventRepository extends Mock implements EventRepository {}

void main() {
  late AddEventCubit sut;
  late MockEventRepository repository;

  setUp(() {
    repository = MockEventRepository();
    sut = AddEventCubit(repository);
  });

  final addEventTestData = [
    'title',
    'subtitle',
    DateTime.now().subtract(const Duration(days: 10)),
    DateTime.now().subtract(const Duration(days: 5)),
  ];
  final testError = Exception('error');
  const testErrorMessage = 'Exception: error';

  group('add', () {
    group('success', () {
      setUp(() {
        when(() => repository.addEvent(
              addEventTestData[0] as String,
              addEventTestData[1] as String,
              addEventTestData[2] as DateTime,
              addEventTestData[3] as DateTime,
            )).thenAnswer((_) async => []);
      });
      blocTest<AddEventCubit, AddEventState>('emits saved: true',
          build: () => sut,
          act: (cubit) => cubit.add(
                addEventTestData[0] as String,
                addEventTestData[1] as String,
                addEventTestData[2] as DateTime,
                addEventTestData[3] as DateTime,
              ),
          expect: () => [
                AddEventState(
                  saved: true,
                ),
              ]);
    });
    group('failure', () {
      setUp(() {
        when(() => repository.addEvent(
              addEventTestData[0] as String,
              addEventTestData[1] as String,
              addEventTestData[2] as DateTime,
              addEventTestData[3] as DateTime,
            )).thenThrow(testError);
      });

      blocTest<AddEventCubit, AddEventState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.add(
          addEventTestData[0] as String,
          addEventTestData[1] as String,
          addEventTestData[2] as DateTime,
          addEventTestData[3] as DateTime,
        ),
        expect: () => [
          AddEventState(
            errorMessage: testErrorMessage,
          ),
        ],
      );
    });
  });
}
