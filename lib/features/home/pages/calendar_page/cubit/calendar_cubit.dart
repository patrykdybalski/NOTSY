import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
import 'package:primary_school/domain/repositories/events_repository.dart';
part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit(this._eventsRepository)
      : super(
          const CalendarState(),
        );
  final EventsRepository _eventsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const CalendarState(
        status: Status.loading,
      ),
    );

    _streamSubscription = _eventsRepository.getEventsStream().listen((data) {
      emit(
        CalendarState(
          calendarItems: data,
          status: Status.success,
        ),
      );
    })
      ..onError(
        (error) {
          emit(
            CalendarState(
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
        CalendarState(
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
