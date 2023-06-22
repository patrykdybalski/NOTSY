part of 'calendar_cubit.dart';

@immutable
class CalendarState {
  const CalendarState({
    required this.calendarItems,
    required this.isLoading,
    required this.errorMessage,
  });
  final List<EventModel> calendarItems;
  final bool isLoading;
  final String errorMessage;
}
