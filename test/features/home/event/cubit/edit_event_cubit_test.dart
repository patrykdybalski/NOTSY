import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/domain/repositories/event/event_repository.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/cubit/edit_event_cubit.dart';

class MockEventRepository extends Mock implements EventRepository {}

void main() {
  late EditEventCubit sut;
  late MockEventRepository repository;

  setUp(() {
    repository = MockEventRepository();
    sut = EditEventCubit(repository);
  });
  final editEventTestData = [
    'title',
    'subtitle',
    DateTime.now().subtract(const Duration(days: 10)),
    DateTime.now().subtract(const Duration(days: 5)),
    'id',
  ];
  final testError = Exception('error');
  const testErrorMessage = 'Exception: error';

  group('edit', () {
    group('success', () {
      setUp(() {
        when(() => repository.editNote(
              editEventTestData[0] as String,
              editEventTestData[1] as String,
              editEventTestData[2] as DateTime,
              editEventTestData[3] as DateTime,
              editEventTestData[4] as String,
            )).thenAnswer((_) async => []);
      });
      blocTest<EditEventCubit, EditEventState>('emits saved: true',
          build: () => sut,
          act: (cubit) => cubit.edit(
                editEventTestData[0] as String,
                editEventTestData[1] as String,
                editEventTestData[2] as DateTime,
                editEventTestData[3] as DateTime,
                editEventTestData[4] as String,
              ),
          expect: () => [
                EditEventState(
                  saved: true,
                ),
              ]);
    });
    group('failure', () {
      setUp(() {
        when(() => repository.editNote(
              editEventTestData[0] as String,
              editEventTestData[1] as String,
              editEventTestData[2] as DateTime,
              editEventTestData[3] as DateTime,
              editEventTestData[4] as String,
            )).thenThrow(testError);
      });

      blocTest<EditEventCubit, EditEventState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.edit(
          editEventTestData[0] as String,
          editEventTestData[1] as String,
          editEventTestData[2] as DateTime,
          editEventTestData[3] as DateTime,
          editEventTestData[4] as String,
        ),
        expect: () => [
          EditEventState(
            errorMessage: testErrorMessage,
          ),
        ],
      );
    });
  });
}
