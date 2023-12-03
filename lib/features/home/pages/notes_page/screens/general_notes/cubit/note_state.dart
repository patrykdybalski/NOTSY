part of 'note_cubit.dart';

@freezed
class NoteState with _$NoteState {
  factory NoteState({
    @Default([]) List<NoteModel> noteItems,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _NoteState;
}
