import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'event_model.freezed.dart';

@freezed
class EventModel with _$EventModel {
  const EventModel._();
  factory EventModel({
    required String title,
    required String subtitle,
    required DateTime selectedDay,
    required DateTime selectedTime,
    required String id,
  }) = _EventModel;

  String selectedDayFormatted() {
    return DateFormat.MMMMd('pl').format(selectedDay);
  }

  String selectedDayFormatted2() {
    return DateFormat.E('pl').format(selectedDay);
  }

  String selectedEditDayFormatted() {
    return DateFormat.yMd('pl').format(selectedDay);
  }

  String selectedTimeFormatted() {
    return DateFormat.Hm().format(selectedTime);
  }
}
