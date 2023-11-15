import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
part 'note_state.dart';
 
class NoteCubit extends Cubit<NoteState> {
  NoteCubit(this._noteRepository)
      : super(const NoteState(
          noteItems: [],
          status: Status.initial,
          errorMessage: '',
        ));
  final NoteRepository _noteRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const NoteState(
        status: Status.loading,
      ),
    );
    _streamSubscription = _noteRepository.getNotesStream().listen((data) {
      emit(
        NoteState(
          noteItems: data,
          status: Status.success,
        ),
      );
    })
      ..onError((error) {
        emit(NoteState(
          status: Status.error,
          errorMessage: error.toString(),
        ));
      });
  }

  Future<void> remove({required String id}) async {
    try {
      await _noteRepository.delete(
        id: id,
      );
      emit(const NoteState(
        status: Status.success,
      ));
    } catch (error) {
      emit(
        NoteState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
