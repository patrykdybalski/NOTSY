part of 'calendar_cubit.dart';

@immutable
class CalendarState {
  const CalendarState(
    {this.calendarItems = const [],
    this.status = Status.initial,
    this.errorMessage,}
  );
  final List<EventModel> calendarItems;
  final Status status;
  final String? errorMessage;
}
