import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_event_state.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit()
      : super(
          const AddEventState(),
        );

  Future<void> add(
    String title,
    String subtitle,
    DateTime selectedDay,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('calendarItems').add(
        {
          'title': title,
          'subtitle': subtitle,
          'selectedDay': selectedDay,
        },
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
