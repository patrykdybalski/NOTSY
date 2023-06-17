part of 'calendar_cubit.dart';

@immutable
class CalendarState {
  const CalendarState({
    required this.calendarItems,
    required this.isLoading,
    required this.errorMessage,
  });
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> calendarItems;
  final bool isLoading;
  final String errorMessage;
}
