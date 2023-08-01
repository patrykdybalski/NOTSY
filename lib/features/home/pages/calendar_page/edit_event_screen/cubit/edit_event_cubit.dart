import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/calendar/events_repository.dart';

part 'edit_event_state.dart';

class EditEventCubit extends Cubit<EditEventState> {
  EditEventCubit(this._eventsRepository) : super(EditEventState());

  final EventsRepository _eventsRepository;

  Future<void> edit(String title, String subtitle, DateTime selectedDay,
      DateTime selectedTime, String id) async {
    try {
      await _eventsRepository.edit(
        title,
        subtitle,
        selectedDay,
        id,
        selectedTime,
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
