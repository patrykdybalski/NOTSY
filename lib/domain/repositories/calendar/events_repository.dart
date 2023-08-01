import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EventsRepository {
  Stream<List<EventModel>> getEventsStream() {
    return FirebaseFirestore.instance
        .collection('calendarItems')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return EventModel(
            title: doc['title'],
            subtitle: doc['subtitle'],
            selectedDay: (doc['selectedDay'] as Timestamp).toDate(),
            selectedTime: (doc['selectedTime'] as Timestamp).toDate(),
            id: doc.id,
          );
        },
      ).toList();
    });
  }

  Future<void> delete({required String id}) async {
    await FirebaseFirestore.instance
        .collection('calendarItems')
        .doc(id)
        .delete();
  }

  Future<void> edit(
    Map<String, dynamic>? updatedFields,
    String docID,
  ) async {
    if (updatedFields == null || updatedFields.isEmpty) {
      return;
    }
    await FirebaseFirestore.instance
        .collection('calendarItems')
        .doc(docID)
        .update(updatedFields);
  }

  Future<void> add(
    String title,
    String subtitle,
    DateTime selectedDay,
    DateTime selectedTime,
  ) async {
    await FirebaseFirestore.instance.collection('calendarItems').add(
      {
        'title': title,
        'subtitle': subtitle,
        'selectedDay': selectedDay,
        'selectedTime': selectedTime,
      },
    );
  }
}
