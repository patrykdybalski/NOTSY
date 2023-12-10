import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_school/domain/repositories/event/event_repository.dart';
part 'add_event_state.dart';
part 'add_event_cubit.freezed.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit(this._eventsRepository)
      : super(
           AddEventState(),
        );
  final EventRepository _eventsRepository;

  Future<void> add(
    String? title,
    String? subtitle,
    DateTime? selectedDay,
    DateTime? selectedTime,
  ) async {
    try {
      await _eventsRepository.addEvent(
        title,
        subtitle,
        selectedDay,
        selectedTime,
      );

      emit(
         AddEventState(saved: true),
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
