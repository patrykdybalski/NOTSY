part of 'add_note_cubit.dart';

@freezed
class AddNoteState with _$AddNoteState {
  factory AddNoteState({
    @Default(false)  bool saved,
   @Default('')   String errorMessage,
  
   
  }) = _AddNoteState;
}

// class AddNoteState {
//   AddNoteState({
//     this.saved = false,
//     this.errorMessage = '',
//   });
//   final bool saved;
//   final String errorMessage;
// }
