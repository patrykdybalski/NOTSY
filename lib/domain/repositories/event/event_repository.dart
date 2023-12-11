import 'package:primary_school/domain/models/event_model/event_model.dart';
import '../../../data/remote_data_sources_firebase/event_remote_data_source.dart';

class EventRepository {
  EventRepository(this._eventRemoteDataSource);

  final EventRemoteDataSource _eventRemoteDataSource;

  Stream<List<EventModel>> getEventsStream() {
    return _eventRemoteDataSource.getEventsData();
  }

   Future<void> addEvent(
    String? title,
    String? subtitle,
    DateTime? selectedDay,
    DateTime? selectedTime,
  ) async {
    await _eventRemoteDataSource.addEventData(
      title,
      subtitle,
      selectedDay,
      selectedTime,
    );
  }
  
  Future<void> editNote(
    String? title,
    String? subtitle,
    DateTime? selectedDay,
    DateTime? selectedTime,
    String docID,
  ) async {
    await _eventRemoteDataSource.editNoteData(
      title,
      subtitle,
      selectedDay,
      selectedTime,
      docID,
    );
  }

  Future<void> deleteEvent({required String id}) async {
    await _eventRemoteDataSource.deleteNote(id: id);
  }

}
