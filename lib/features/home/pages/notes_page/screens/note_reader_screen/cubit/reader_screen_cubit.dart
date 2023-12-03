import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
part 'reader_screen_state.dart';
part 'reader_screen_cubit.freezed.dart';

class ReaderScreenCubit extends Cubit<ReaderScreenState> {
  ReaderScreenCubit(this._noteRepository) : super( ReaderScreenState());

  final NoteRepository _noteRepository;

  Future<void> remove({required String id}) async {
    try {
      await _noteRepository.delete(id: id);
      emit( ReaderScreenState(
        delete: true,
      ));
    } catch (error) {
      emit(
        ReaderScreenState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
