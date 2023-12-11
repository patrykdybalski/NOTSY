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

  final testEventModel = EventModel(
    title: 'title',
    subtitle: 'subtitle',
    selectedDay: DateTime(DateTime.now().year, 6, 23),
    selectedTime: DateTime(DateTime.now().year, 6, 23),
    id: 'id',
  );
  final editEventTestData = [
    'title',
    'subtitle',
    DateTime.now().subtract(const Duration(days: 10)),
    DateTime.now().subtract(const Duration(days: 5)),
  ];
  final addEventTestData = [
    'title',
    'subtitle',
    DateTime.now().subtract(const Duration(days: 10)),
    DateTime.now().subtract(const Duration(days: 5)),
    'id',
  ];

  group('getEventsStream', () {
    test('should call_eventRemoteDataSource.getEventsData() method', () {
      when(() => dataSource.getEventsData())
          .thenAnswer((_) => Stream.value([]));

      sut.getEventsStream();

      verify(() => dataSource.getEventsData()).called(1);
    });

    test('should get event data from Firebase', () {
      when(() => dataSource.getEventsData())
          .thenAnswer((_) => Stream.value([testEventModel]));

      final result = sut.getEventsStream();

      expect(result, emits([testEventModel]));
    });
  });

  group('addEvent', () {
    test('should call _eventRemoteDataSource.addEventData method', () async {
      when(() => dataSource.addEventData(
            editEventTestData[0] as String?,
            editEventTestData[1] as String?,
            editEventTestData[2] as DateTime?,
            editEventTestData[3] as DateTime?,
          )).thenAnswer((_) async => []);

      await sut.addEvent(
        editEventTestData[0] as String?,
        editEventTestData[1] as String?,
        editEventTestData[2] as DateTime?,
        editEventTestData[3] as DateTime?,
      );

      verify(() => dataSource.addEventData(
            editEventTestData[0] as String?,
            editEventTestData[1] as String?,
            editEventTestData[2] as DateTime?,
            editEventTestData[3] as DateTime?,
          )).called(1);
    });
  });

  group('editNote', () {
    test('should call_eventRemoteDataSource.editNoteData() method', () async {
      when(() => dataSource.editNoteData(
            addEventTestData[0] as String?,
            addEventTestData[1] as String?,
            addEventTestData[2] as DateTime?,
            addEventTestData[3] as DateTime?,
            addEventTestData[4] as String,
          )).thenAnswer((_) async => []);

      sut.editNote(
        addEventTestData[0] as String?,
        addEventTestData[1] as String?,
        addEventTestData[2] as DateTime?,
        addEventTestData[3] as DateTime?,
        addEventTestData[4] as String,
      );

      verify(() => dataSource.editNoteData(
            addEventTestData[0] as String?,
            addEventTestData[1] as String?,
            addEventTestData[2] as DateTime?,
            addEventTestData[3] as DateTime?,
            addEventTestData[4] as String,
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
