import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/data/remote_data_sources_firebase/note_remote_data_source.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

class MockNoteDataSource extends Mock implements NoteRemoteDataSource {}

void main() {
  late NoteRepository sut;
  late MockNoteDataSource dataSource;

  setUp(() {
    dataSource = MockNoteDataSource();
    sut = NoteRepository(dataSource);
  });

  group('getNotesStream', () {
    test('description', () {
      when(
        () => dataSource.getNotesData(),
      ).thenAnswer((_) => Stream.value([
            NoteModel(
                'title',
                'subtitle',
                DateTime(DateTime.now().year, 6, 23),
                DateTime(DateTime.now().year, 6, 23),
                const Color(0xFF42A5F5),
                'id')
          ]));
      final result = sut.getNotesStream();

      expect(
          result,
          emits([
            NoteModel(
                'title',
                'subtitle',
                DateTime(DateTime.now().year, 6, 23),
                DateTime(DateTime.now().year, 6, 23),
                const Color(0xFF42A5F5),
                'id')
          ]));
    });
  });
}
