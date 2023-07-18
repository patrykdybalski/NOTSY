import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit()
      : super(const NoteState(
          documents: [],
          status: Status.initial,
          errorMessage: '',
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const NoteState(
        status: Status.loading,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('noteItems')
        .snapshots()
        .listen((notes) {
      final noteModels = notes.docs.map(
        (doc) {
          return NoteModel(
            title: doc['title'],
            subtitle: doc['subtitle'],
            id: doc.id,
          );
        },
      ).toList();
      emit(
        NoteState(
          documents: noteModels,
          status: Status.success,
        ),
      );
    })
      ..onError((error) {
        emit(NoteState(
          status: Status.error,
          errorMessage: error.toString(),
        ));
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
