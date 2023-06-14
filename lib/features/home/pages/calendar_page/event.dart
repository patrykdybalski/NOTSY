class EventModel {
  final String title;
  final String subtitle;
  EventModel({required this.title, required this.subtitle});
  @override
  String toString() {
    return title;
  }
}
