import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:primary_school/domain/repositories/event/events_repository.dart';
part 'add_event_state.dart';

@injectable  
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
    DateTime selectedTime,
  ) async {
    try {
      await _eventsRepository.add(
        title,
        subtitle,
        selectedDay,
        selectedTime,
      );
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
}
