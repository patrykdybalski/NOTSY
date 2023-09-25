import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';

class NoteRepository {
  Stream<List<NoteModel>> getNotesStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc("N4idavG5HPeXOMj0MGYHYp2Pvzt1")
        .collection('noteItems')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return NoteModel(
            title: doc['title'],
            subtitle: doc['subtitle'],

            // createdDate: (doc['createdDate'] as Timestamp).toDate(),
            // updatedDate: (doc['updatedDate'] as Timestamp).toDate(),
            createdDate: doc['createdDate'] != null
                ? (doc['createdDate'] as Timestamp).toDate()
                : DateTime.now(),
            updatedDate: doc['updatedDate'] != null
                ? (doc['updatedDate'] as Timestamp).toDate()
                : DateTime.now(),
            color: Color(int.parse(doc['color'] ??
                '0xFF000000')), // Parsuj string jako int i konwertuj na Color
            id: doc.id,
          );
        },
      ).toList();
    });
  }

  Future<void> add(
    String title,
    String subtitle,
    DateTime createdDate,
    DateTime updatedDate,
    Color selectedColor,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc("N4idavG5HPeXOMj0MGYHYp2Pvzt1")
        .collection('noteItems')
        .add({
      'title': title,
      'subtitle': subtitle,
      'createdDate': createdDate, // Ustawienie daty utworzenia
      'updatedDate': updatedDate, // Ustawienie daty aktualizacji
      'color':
          selectedColor.value.toString(), // Zapisz wartość koloru jako string
    });
  }

  Future<void> edit(
    String title,
    String subtitle,
    DateTime createdDate,
    DateTime updatedDate,
    String docId,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc("N4idavG5HPeXOMj0MGYHYp2Pvzt1")
        .collection('noteItems')
        .doc(docId)
        .update({
      'title': title,
      'subtitle': subtitle,
      'createdDate': createdDate, // Ustawienie daty utworzenia
      'updatedDate': updatedDate, // Ustawienie daty aktualizac
    });
  }

  Future<void> delete({required String id}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc("N4idavG5HPeXOMj0MGYHYp2Pvzt1")
        .collection('noteItems')
        .doc(id)
        .delete();
  }
}
