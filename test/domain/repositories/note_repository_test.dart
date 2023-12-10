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
    test('should call _noteRemoteDataSource.getNotesData() method', () {
      when(() => dataSource.getNotesData()).thenAnswer((_) => Stream.value([]));

      sut.getNotesStream();

      verify(() => dataSource.getNotesData()).called(1);
    });

    test('should get note data from Firebase', () {
      when(() => dataSource.getNotesData()).thenAnswer((_) => Stream.value([
            NoteModel(
              'title',
              'subtitle',
              DateTime(DateTime.now().year, 6, 23),
              DateTime(DateTime.now().year, 6, 23),
              const Color(0xFF42A5F5),
              'id',
            )
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
              'id',
            )
          ]));
    });
  });

  group('add', () {
    test('should call _noteRemoteDataSource.addNotes() method', () async {
      when(() => dataSource.addNotes(
            'title',
            'subtitle',
            DateTime(DateTime.now().year, 6, 23),
            DateTime(DateTime.now().year, 6, 23),
            const Color(0xFF42A5F5),
          )).thenAnswer((_) async => []);

      await sut.add(
        'title',
        'subtitle',
        DateTime(DateTime.now().year, 6, 23),
        DateTime(DateTime.now().year, 6, 23),
        const Color(0xFF42A5F5),
      );

      verify(() => dataSource.addNotes(
          'title',
          'subtitle',
          DateTime(DateTime.now().year, 6, 23),
          DateTime(DateTime.now().year, 6, 23),
          const Color(0xFF42A5F5))).called(1);
    });
  });

  group('edit', () {
    test('should call _noteRemoteDataSource.editNotes() method', () async {
      when(() => dataSource.editNotes(
            'title',
            'subtitle',
            DateTime(DateTime.now().year, 6, 23),
            DateTime(DateTime.now().year, 6, 23),
            'id',
          )).thenAnswer((_) async => []);

      await sut.edit(
        'title',
        'subtitle',
        DateTime(DateTime.now().year, 6, 23),
        DateTime(DateTime.now().year, 6, 23),
        'id',
      );

      verify(() => dataSource.editNotes(
            'title',
            'subtitle',
            DateTime(DateTime.now().year, 6, 23),
            DateTime(DateTime.now().year, 6, 23),
            'id',
          )).called(1);
    });
  });

  group('delete', () {
    test('should call _noteRemoteDataSource.delete() method', () async {
      when(() => dataSource.deleteNotes('id')).thenAnswer((_) async => []);

      await sut.delete(id: 'id');

      verify(() => dataSource.deleteNotes('id')).called(1);
    });
  });
}
