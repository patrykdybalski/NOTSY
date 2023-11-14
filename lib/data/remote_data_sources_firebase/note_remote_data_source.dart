import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';


@injectable  
class NoteRemoteDataSource {
  Stream<List<NoteModel>> getNotesData() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User in not logged in');
    }
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('noteItems')
          .orderBy('createdDate')
          .snapshots()
          .map(
        (querySnapshot) {
          return querySnapshot.docs.map(
            (doc) {
              return NoteModel(
                title: doc['title'],
                subtitle: doc['subtitle'],
                createdDate: (doc['createdDate'] as Timestamp).toDate(),
                updatedDate: (doc['updatedDate'] as Timestamp).toDate(),
                color: Color(int.parse(
                  doc['color'] ??
                      '0xFF000000', // Parsuj string jako int i konwertuj na Color
                )),
                id: doc.id,
              );
            },
          ).toList();
        },
      );
    } catch (error) {
      throw Exception(
        error,
      );
    }
  }

  Future<void> addNotes(
    String title,
    String subtitle,
    DateTime createdDate,
    DateTime updatedDate,
    Color selectedColor,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User in not logged in');
    }
    {
      try {
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('noteItems')
            .add({
          'title': title,
          'subtitle': subtitle,
          'createdDate': createdDate, // Ustawienie daty utworzenia
          'updatedDate': updatedDate, // Ustawienie daty aktualizacji
          'color': selectedColor.value.toString(),
        });
      } catch (error) {
        throw Exception(
          error,
        );
      }
    }
  }

  Future<void> editNotes(
    String title,
    String subtitle,
    DateTime createdDate,
    DateTime updatedDate,
    String docId,
  ) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User in not logged in');
    }
    {
      try {
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('noteItems')
            .doc(docId)
            .update(
          {
            'title': title,
            'subtitle': subtitle,
            'createdDate': createdDate, // Ustawienie daty utworzenia
            'updatedDate': updatedDate, // Ustawienie daty aktualizacji
          },
        );
      } catch (error) {
        throw Exception(
          error,
        );
      }
    }
  }

  Future<void> deleteNotes(String id) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('noteItems')
          .doc(id)
          .delete();
    } catch (error) {
      throw Exception(error);
    }
  }
}
