import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/event/events_repository.dart';
part 'event_state.dart';


class EventCubit extends Cubit<EventState> {
  EventCubit(this._eventsRepository)
      : super(
          const EventState(),
        );
  final EventsRepository _eventsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const EventState(
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
      await _eventsRepository.delete(id: documentID);
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
