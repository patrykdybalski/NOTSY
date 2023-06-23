import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/events_repository.dart';

part 'add_event_state.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit(this._eventsRepository)
      : super(
          const AddEventState(),
        );
  final EventsRepository _eventsRepository;

  Future<void> add(
    String title,
    String subtitle,
    DateTime selectedDay,
  ) async {
    try {
      await _eventsRepository.add(title, subtitle, selectedDay);
      emit(
        const AddEventState(saved: true),
      );
    } catch (error) {
      emit(
        AddEventState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  String selectedDayFormatted() {
    return 'example';
  }
}
