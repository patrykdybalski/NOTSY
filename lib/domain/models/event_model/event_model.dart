class EventModel {
  EventModel({
    required this.title,
    required this.subtitle,
    required this.selectedDay,
    required this.id,
  });
  final String title;
  final String subtitle;
  final DateTime selectedDay;
  final String id;

  String selectedDayFormatted() {
    return 'example';
  }
}
