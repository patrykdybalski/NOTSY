import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this._noteRepository) : super(AddNoteState());

  final NoteRepository _noteRepository;

  Future<void> add(
    String title,
    String subtitle,
    DateTime createdDate,
    DateTime updatedDate,
    Color selectedColor,
  ) async {
    try {
      await _noteRepository.add(
        title,
        subtitle,
        createdDate,
        updatedDate,
        selectedColor,
      );
      emit(
        AddNoteState(saved: true),
      );
      
    } catch (error) {
      emit(AddNoteState(
        errorMessage: error.toString(),
      ));
    }
    
  }
  
}
