import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_school/domain/repositories/event/event_repository.dart';
part 'edit_event_state.dart';
part 'edit_event_cubit.freezed.dart';


class EditEventCubit extends Cubit<EditEventState> {
  EditEventCubit(this._eventsRepository) : super(EditEventState());

  final EventRepository _eventsRepository;

  Future<void> edit(
    String? title,
    String? subtitle,
    DateTime? updatedDay,
    DateTime? updatedTime,
    String id,
  ) async {
    try {
      await _eventsRepository.editNote(
        title,
        subtitle,
        updatedDay,
        updatedTime,
        id,
      );
      emit(
        EditEventState(saved: true),
      );
    } catch (error) {
      emit(
        EditEventState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
