import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteState());

  Future<void> add(
    String title,
    String subtitle,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('noteItems').add({
        'title': title,
        'subtitle': subtitle,
      });
      emit(AddNoteState(
        saved: true,
      ));
    } catch (error) {
      emit(AddNoteState(
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> remove(String id) async {
    try {
      await FirebaseFirestore.instance.collection('noteItems').doc(id).delete();
      emit(AddNoteState());
    } catch (error) {
      emit(
        AddNoteState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
