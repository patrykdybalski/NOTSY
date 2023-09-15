part of 'add_note_cubit.dart';

class AddNoteState {
  AddNoteState({
    this.saved = false,
    this.errorMessage = '',
  });
  final bool saved;
  final String errorMessage;
}
