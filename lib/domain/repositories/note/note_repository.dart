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
          );
        },
      ).toList();
    });
  }

  Future<void> add(
    String title,
    String subtitle,
  ) async {
    await FirebaseFirestore.instance.collection('noteItems').add({
      'title': title,
      'subtitile': subtitle,
    });
  }

  Future<void> delete({required String id}) async {
    await FirebaseFirestore.instance.collection('noteItems').doc(id).delete();
  }
}
