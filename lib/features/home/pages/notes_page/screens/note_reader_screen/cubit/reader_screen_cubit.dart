import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

part 'reader_screen_state.dart';

class ReaderScreenCubit extends Cubit<ReaderScreenState> {
  ReaderScreenCubit(this._noteRepository) : super(const ReaderScreenState());

  final NoteRepository _noteRepository;

  Future<void> remove({required String id}) async {
    try {
      await _noteRepository.delete(id: id);
      emit(const ReaderScreenState(
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
