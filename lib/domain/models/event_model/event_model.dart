class EventModel {
  EventModel({
    required this.title,
    required this.subtitle,
    required this.selectedDay,
  });
  final String title;
  final String subtitle;
  final DateTime selectedDay;

  String selectedDayFormatted() {
    return 'example';
  }
}
