part of 'edit_note_cubit.dart';

class EditNoteState {
  EditNoteState({
    this.saved = false,
    this.errorMessage = '',
  });
  final bool saved;
  final String errorMessage;
}
