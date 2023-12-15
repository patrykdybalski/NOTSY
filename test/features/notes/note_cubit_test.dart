import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/cubit/note_cubit.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late NoteCubit sut;
  late MockNoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = NoteCubit(repository);
  });
  final testNoteModel = NoteModel(
    'title',
    'subtitle',
    DateTime(DateTime.now().year, 6, 23),
    DateTime(DateTime.now().year, 6, 23),
    Colors.white,
    'id',
  );
  final testError = Exception('error');
  const testErrorMessage = 'Exception: error';

  group('start()', () {
    group('succes', () {
      setUp(() {
        when(() => repository.getNotesStream())
            .thenAnswer((_) => Stream.value([testNoteModel]));
      });

      blocTest<NoteCubit, NoteState>(
          'emits Status.loading then Status.success with EventModel',
          build: () => sut,
          act: (cubit) => cubit.start(),
          expect: (() => {
                NoteState(status: Status.loading),
                NoteState(
                  status: Status.success,
                  noteItems: [testNoteModel],
                )
              }));
    });
    group('failure', () {
      setUp(() {
        when(() => repository.getNotesStream())
            .thenAnswer((_) => Stream.error(testError));
      });

      blocTest<NoteCubit, NoteState>(
        'emits Status.loading then Status.error with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.start(),
        expect: () => [
          NoteState(status: Status.loading),
          NoteState(
            status: Status.error,
            errorMessage: testErrorMessage,
          ),
        ],
      );
    });
  });

  group('remove', () {
    group('succes', () {
      setUp(() {
        when(() => repository.delete(id: 'id')).thenAnswer((_) async => []);
      });
      blocTest<NoteCubit, NoteState>(
        'emits  Status.success and delete event',
        build: () => sut,
        act: (cubit) => cubit.remove(id: 'id'),
        expect: () => [
          NoteState(status: Status.success),
        ],
      );
    });
    group('failure', () {
      setUp(() {
        when(() => repository.delete(id: 'id')).thenThrow(testError);
      });

      blocTest<NoteCubit, NoteState>(
        'emits  Status.error with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.remove(id: 'id'),
        expect: () => [
          NoteState(
            status: Status.error,
            errorMessage: testErrorMessage,
          ),
        ],
      );
    });
  });
}
