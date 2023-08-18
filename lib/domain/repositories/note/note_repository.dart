import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';

class NoteRepository {
  Stream<List<NoteModel>> getNotesStream() {
    return FirebaseFirestore.instance
        .collection('noteItems')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return NoteModel(
            title: doc['title'],
            subtitle: doc['subtitle'],
            id: doc.id,
            // createdDate: (doc['createdDate'] as Timestamp).toDate(),
            // updatedDate: (doc['updatedDate'] as Timestamp).toDate(),
            createdDate: doc['createdDate'] != null
                ? (doc['createdDate'] as Timestamp).toDate()
                : DateTime.now(),
            updatedDate: doc['updatedDate'] != null
                ? (doc['updatedDate'] as Timestamp).toDate()
                : DateTime.now(),
          );
        },
      ).toList();
    });
  }

  Future<void> add(
    String title,
    String subtitle,
  ) async {
    final currentTime = DateTime.now();
    await FirebaseFirestore.instance.collection('noteItems').add({
      'title': title,
      'subtitle': subtitle,
      'createdDate': currentTime, // Ustawienie daty utworzenia
      'updatedDate': currentTime, // Ustawienie daty aktualizacji
    });
  }

  Future<void> edit(
    Map<String, dynamic> updatedFields,
    String docId,
  ) async {
    updatedFields['updatedDate'] =
        FieldValue.serverTimestamp(); // Ustawienie daty aktualizacji
    await FirebaseFirestore.instance
        .collection('noteItems')
        .doc(docId)
        .update(updatedFields);
  }

  Future<void> delete({required String id}) async {
    await FirebaseFirestore.instance.collection('noteItems').doc(id).delete();
  }
}
