part of 'note_cubit.dart';

@immutable
class NoteState {
  const NoteState({
    this.noteItems = const [],
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<NoteModel> noteItems;
  final Status status;
  final String? errorMessage;
}
