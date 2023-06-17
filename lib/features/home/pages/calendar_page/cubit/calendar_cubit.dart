import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(const CalendarState(
          calendarItems: [],
          isLoading: false,
          errorMessage: '',
        ));

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
      emit(
        CalendarState(
          calendarItems: data.docs,
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
