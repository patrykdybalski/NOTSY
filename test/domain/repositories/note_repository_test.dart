import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/data/remote_data_sources_firebase/note_remote_data_source.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

class MockNoteDataSource extends Mock implements NoteRemoteDataSource {}

void main() {
  NoteRepository sut;
  MockNoteDataSource dataSource;

  setUp(() {
    dataSource = MockNoteDataSource();
    sut = NoteRepository(dataSource);
  });
}
