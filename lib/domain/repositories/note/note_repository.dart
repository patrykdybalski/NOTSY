import 'package:flutter/material.dart';
import 'package:primary_school/data/remote_data_sources/note_remote_data_source.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';

class NoteRepository {
  NoteRepository(this._noteRemoteDataSource);
  final NoteRemoteDataSource _noteRemoteDataSource;

  Stream<List<NoteModel>> getNotesStream() {
    return _noteRemoteDataSource.getNotesData();
  }

  Future<void> add(
    String title,
    String subtitle,
    DateTime createdDate,
    DateTime updatedDate,
    Color selectedColor,
  ) async {
    await _noteRemoteDataSource.addNotes(
      title,
      subtitle,
      createdDate,
      updatedDate,
      selectedColor,
    );
  }

  Future<void> edit(
    String title,
    String subtitle,
    DateTime createdDate,
    DateTime updatedDate,
    String docId,
  ) async {
    await _noteRemoteDataSource.editNotes(
      title,
      subtitle,
      createdDate,
      updatedDate,
      docId,
    );
  }

  Future<void> delete({required String id}) async {
    await _noteRemoteDataSource.deleteNotes(id);
  }
}
