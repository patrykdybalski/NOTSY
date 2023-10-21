import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EventsRepository {
  Stream<List<EventModel>> getEventsStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('calendarItems')
        .orderBy('selectedDay')
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
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('calendarItems')
        .doc(id)
        .delete();
  }

  Future<void> edit(
    String title,
    String subtitle,
    DateTime selectedDay,
    DateTime selectedTime,
    String docID,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('calendarItems')
        .doc(docID)
        .update({
      'title': title,
      'subtitle': subtitle,
      'selectedDay': selectedDay,
      'selectedTime': selectedTime,
    });
  }

  Future<void> add(
    String title,
    String subtitle,
    DateTime selectedDay,
    DateTime selectedTime,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('calendarItems')
        .add(
      {
        'title': title,
        'subtitle': subtitle,
        'selectedDay': selectedDay,
        'selectedTime': selectedTime,
      },
    );
  }
}
