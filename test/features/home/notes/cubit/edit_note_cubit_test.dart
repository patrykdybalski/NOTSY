import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late EditNoteCubit sut;
  late MockNoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = EditNoteCubit(repository);
  });
  final editNoteTestData = [
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
        when(() => repository.edit(
              editNoteTestData[0] as String,
              editNoteTestData[1] as String,
              editNoteTestData[2] as DateTime,
              editNoteTestData[3] as DateTime,
              editNoteTestData[4] as String,
            )).thenAnswer((_) async => []);
      });
      blocTest<EditNoteCubit, EditNoteState>('emits saved: true',
          build: () => sut,
          act: (cubit) => cubit.edit(
                editNoteTestData[0] as String,
                editNoteTestData[1] as String,
                editNoteTestData[2] as DateTime,
                editNoteTestData[3] as DateTime,
                editNoteTestData[4] as String,
              ),
          expect: () => [
                EditNoteState(
                  saved: true,
                ),
              ]);
    });
    group('failure', () {
      setUp(() {
        when(() => repository.edit(
              editNoteTestData[0] as String,
              editNoteTestData[1] as String,
              editNoteTestData[2] as DateTime,
              editNoteTestData[3] as DateTime,
              editNoteTestData[4] as String,
            )).thenThrow(testError);
      });

      blocTest<EditNoteCubit, EditNoteState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.edit(
          editNoteTestData[0] as String,
          editNoteTestData[1] as String,
          editNoteTestData[2] as DateTime,
          editNoteTestData[3] as DateTime,
          editNoteTestData[4] as String,
        ),
        expect: () => [
          EditNoteState(
            errorMessage: testErrorMessage,
          ),
        ],
      );
    });
  });
}
