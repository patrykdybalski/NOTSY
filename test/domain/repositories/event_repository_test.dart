import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primary_school/data/remote_data_sources_firebase/event_remote_data_source.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/event/event_repository.dart';

class MockEventDataSource extends Mock implements EventRemoteDataSource {}

void main() {
  late EventRepository sut;
  late MockEventDataSource dataSource;

  setUp(() {
    dataSource = MockEventDataSource();
    sut = EventRepository(dataSource);
  });

  group('getEventsStream', () {
    test('should call_eventRemoteDataSource.getEventsData() method', () {
      when(() => dataSource.getEventsData())
          .thenAnswer((_) => Stream.value([]));

      sut.getEventsStream();

      verify(() => dataSource.getEventsData()).called(1);
    });

    test('should get event data from Firebase', () {
      when(() => dataSource.getEventsData()).thenAnswer((_) => Stream.value([
            EventModel(
              title: 'title',
              subtitle: 'subtitle',
              selectedDay: DateTime(DateTime.now().year, 6, 23),
              selectedTime: DateTime(DateTime.now().year, 6, 23),
              id: 'id',
            )
          ]));

      final result = sut.getEventsStream();

      expect(
          result,
          emits([
            EventModel(
              title: 'title',
              subtitle: 'subtitle',
              selectedDay: DateTime(DateTime.now().year, 6, 23),
              selectedTime: DateTime(DateTime.now().year, 6, 23),
              id: 'id',
            )
          ]));
    });
  });

  group('addEvent', () {
    test('should call _eventRemoteDataSource.addEventData method', () async {
      when(() => dataSource.addEventData(
            'title',
            'subtitle',
            DateTime(DateTime.now().year, 6, 23),
            DateTime(DateTime.now().year, 6, 23),
          )).thenAnswer((_) async => []);

      await sut.addEvent(
        'title',
        'subtitle',
        DateTime(DateTime.now().year, 6, 23),
        DateTime(DateTime.now().year, 6, 23),
      );

      verify(() => dataSource.addEventData(
            'title',
            'subtitle',
            DateTime(DateTime.now().year, 6, 23),
            DateTime(DateTime.now().year, 6, 23),
          )).called(1);
    });
  });

  group('editNote', () {
    test('should call_eventRemoteDataSource.editNoteData() method', () async {
      when(() => dataSource.editNoteData(
            'title',
            'subtitle',
            DateTime(DateTime.now().year, 6, 23),
            DateTime(DateTime.now().year, 6, 23),
            'id',
          )).thenAnswer((_) async => []);

      sut.editNote(
        'title',
        'subtitle',
        DateTime(DateTime.now().year, 6, 23),
        DateTime(DateTime.now().year, 6, 23),
        'id',
      );

      verify(() => dataSource.editNoteData(
            'title',
            'subtitle',
            DateTime(DateTime.now().year, 6, 23),
            DateTime(DateTime.now().year, 6, 23),
            'id',
          )).called(1);
    });
  });

  group('delete', () {
    test('should call_eventRemoteDataSource.deleteNote() method', () async {
      when(() => dataSource.deleteNote(id: 'id')).thenAnswer((_) async => []);

      sut.delete(id: 'id');

      verify(() => dataSource.deleteNote(id: 'id')).called(1);
    });
  });
}
