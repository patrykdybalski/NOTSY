import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/calendar/events_repository.dart';

part 'edit_event_state.dart';

class EditEventCubit extends Cubit<EditEventState> {
  EditEventCubit(this._eventsRepository) : super(EditEventState());

  final EventsRepository _eventsRepository;

  Future<void> edit(
    String id,
    Map<String, dynamic>? updatedFields,
  ) async {
    if (updatedFields == null || updatedFields.isEmpty) {
      emit(EditEventState(errorMessage: "Brak zmian do zapisania"));
      return;
    }

    try {
      await _eventsRepository.edit(
        updatedFields,
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
