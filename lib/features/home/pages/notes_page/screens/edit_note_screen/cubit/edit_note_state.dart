part of 'edit_note_cubit.dart';

@freezed
class EditNoteState with _$EditNoteState {
  factory EditNoteState({
     @Default(false)  bool saved,
   @Default('')   String errorMessage,
  
  
  }) = _EditNoteState;
}


