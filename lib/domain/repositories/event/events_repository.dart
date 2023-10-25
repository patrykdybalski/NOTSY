import 'package:primary_school/data/remote_data_sources/event_remote_data_source.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EventsRepository {
  EventsRepository(this._eventRemoteDataSource);

  final EventRemoteDataSource _eventRemoteDataSource;

  Stream<List<EventModel>> getEventsStream() {
    return _eventRemoteDataSource.getEventsData();
  }

  Future<void> delete({required String id}) async {
    await _eventRemoteDataSource.deleteNote(id: id);
  }

  Future<void> edit(
    String title,
    String subtitle,
    DateTime selectedDay,
    DateTime selectedTime,
    String docID,
  ) async {
    await _eventRemoteDataSource.editNote(
      title,
      subtitle,
      selectedDay,
      selectedTime,
      docID,
    );
  }

  Future<void> add(
    String title,
    String subtitle,
    DateTime selectedDay,
    DateTime selectedTime,
  ) async {
    await _eventRemoteDataSource.addNote(
      title,
      subtitle,
      selectedDay,
      selectedTime,
    );
  }
}
