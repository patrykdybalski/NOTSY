import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/event/event_repository.dart';
part 'event_state.dart';
part 'event_cubit.freezed.dart';

class EventCubit extends Cubit<EventState> {
  bool isNoteAdded = false; // Pole przechowujące informację o dodanej notatce
  EventCubit(this._eventsRepository) : super(EventState());
  
  final EventRepository _eventsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      EventState(
        status: Status.loading,
      ),
    );

    _streamSubscription = _eventsRepository.getEventsStream().listen((data) {
      emit(
        EventState(
          calendarItems: data,
          status: Status.success,
        ),
      );
    })
      ..onError(
        (error) {
          emit(
            EventState(
              status: Status.error,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _eventsRepository.deleteEvent(id: documentID);
    } catch (error) {
      emit(
        EventState(
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
