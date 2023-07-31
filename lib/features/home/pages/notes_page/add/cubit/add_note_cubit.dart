import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit(this._noteRepository) : super(AddNoteState());

  final NoteRepository _noteRepository;

  Future<void> add(
    String title,
    String subtitle,
  ) async {
    try {
      await _noteRepository.add(
        title,
        subtitle,
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

  Future<void> edit(
    String title,
    String subtitle,
    String docId,
  ) async {
    try {
      await _noteRepository.edit(
        title,
        subtitle,
        docId,
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

  Future<void> remove({required String id}) async {
    try {
      await _noteRepository.delete(
        id: id,
      );
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
