import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/note_reader_screen/cubit/reader_screen_cubit.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late ReaderScreenCubit sut;
  late MockNoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = ReaderScreenCubit(repository);
  });

  final testError = Exception('error');
  const testErrorMessage = 'Exception: error';

  group('remove()', () {
    group('success', () {
      setUp(() {
        when(() => repository.delete(id: 'id')).thenAnswer(
          (_) async => [],
        );
      });
      blocTest<ReaderScreenCubit, ReaderScreenState>('emits delete: true',
          build: () => sut,
          act: (cubit) => cubit.remove(id: 'id'),
          expect: () => [
                ReaderScreenState(
                  delete: true,
                ),
              ]);
    });
    group('failure', () {
      setUp(() {
        when(() => repository.delete(id: 'id')).thenThrow(testError);
      });

      blocTest<ReaderScreenCubit, ReaderScreenState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.remove(id: 'id'),
        expect: () => [
          ReaderScreenState(
            errorMessage: testErrorMessage,
          ),
        ],
      );
    });
  });
}
