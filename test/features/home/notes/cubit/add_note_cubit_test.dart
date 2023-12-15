import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/add_note_page/cubit/add_note_cubit.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late AddNoteCubit sut;
  late MockNoteRepository repository;

  setUp(() {
    repository = MockNoteRepository();
    sut = AddNoteCubit(repository);
  });
  final addNoteTestData = [
    'title',
    'subtitle',
    DateTime.now().subtract(const Duration(days: 10)),
    DateTime.now().subtract(const Duration(days: 5)),
    Colors.white,
  ];
  final testError = Exception('error');
  const testErrorMessage = 'Exception: error';

  group('add', () {
    group('success', () {
      setUp(() {
        when(() => repository.add(
              addNoteTestData[0] as String,
              addNoteTestData[1] as String,
              addNoteTestData[2] as DateTime,
              addNoteTestData[3] as DateTime,
              addNoteTestData[4] as Color,
            )).thenAnswer((_) async => []);
      });
      blocTest<AddNoteCubit, AddNoteState>('emits saved: true',
          build: () => sut,
          act: (cubit) => cubit.add(
                addNoteTestData[0] as String,
                addNoteTestData[1] as String,
                addNoteTestData[2] as DateTime,
                addNoteTestData[3] as DateTime,
                addNoteTestData[4] as Color,
              ),
          expect: () => [
                AddNoteState(
                  saved: true,
                ),
              ]);
    });
    group('failure', () {
      setUp(() {
        when(() => repository.add(
              addNoteTestData[0] as String,
              addNoteTestData[1] as String,
              addNoteTestData[2] as DateTime,
              addNoteTestData[3] as DateTime,
              addNoteTestData[4] as Color,
            )).thenThrow(testError);
      });

      blocTest<AddNoteCubit, AddNoteState>(
        'emits state with errorMessage',
        build: () => sut,
        act: (cubit) => cubit.add(
          addNoteTestData[0] as String,
          addNoteTestData[1] as String,
          addNoteTestData[2] as DateTime,
          addNoteTestData[3] as DateTime,
          addNoteTestData[4] as Color,
        ),
        expect: () => [
          AddNoteState(
            errorMessage: testErrorMessage,
          ),
        ],
      );
    });
  });
}
