import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';
part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(
          const CalendarState(
            calendarItems: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const CalendarState(
        calendarItems: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('calendarItems')
        .snapshots()
        .listen((data) {
      final eventModels = data.docs.map(
        (doc) {
          return EventModel(
            title: doc['title'],
            subtitle: doc['subtitle'],
            selectedDay: (doc['selectedDay'] as Timestamp).toDate(),
            id: doc.id,
          );
        },
      ).toList();
      emit(
        CalendarState(
          calendarItems: eventModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          CalendarState(
            calendarItems: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
