import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit(this._noteRepository) : super(EditNoteState());
  final NoteRepository _noteRepository;

  Future<void> edit(
    Map<String, dynamic> updatedFields,
    String docId,
  ) async {
    
    try {
      await _noteRepository.edit(
        updatedFields,
        docId,
      );
      emit(
        EditNoteState(saved: true),
      );
    } catch (error) {
      emit(EditNoteState(
        errorMessage: error.toString(),
      ));
    }
  }
}
