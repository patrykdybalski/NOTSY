import 'package:intl/intl.dart';

class EventModel {
  EventModel({
    required this.title,
    required this.subtitle,
    required this.selectedDay,
    required this.selectedTime,
    required this.id,
  });
  final String title;
  final String subtitle;
  final DateTime selectedDay;
  final DateTime selectedTime;
  final String id;

  String selectedDayFormatted() {
    return DateFormat.Md().format(selectedDay);
  }

  String selectedTimeFormatted() {
    return DateFormat.Hm().format(selectedTime);
  }

  List<EventModel> eventLoader(DateTime day) {
    return eventLoader(day);
  }
}
