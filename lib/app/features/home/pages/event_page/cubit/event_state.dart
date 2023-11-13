part of 'event_cubit.dart';

@immutable
class EventState {
  const EventState(
    {this.calendarItems = const [],
    this.status = Status.initial,
    this.errorMessage,}
  );
  final List<EventModel> calendarItems;
  final Status status;
  final String? errorMessage;
}
