part of 'note_cubit.dart';

@immutable
class NoteState {
  const NoteState({
    this.documents = const [],
    this.status = Status.initial,
    this.errorMessage,
  });
  final List<NoteModel> documents;
  final Status status;
  final String? errorMessage;
}
