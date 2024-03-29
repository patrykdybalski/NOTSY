part of 'event_cubit.dart';

@freezed
class EventState with _$EventState {
 
  factory EventState({
    @Default([]) List<EventModel> calendarItems,
    @Default(Status.initial) Status status,
     String? errorMessage,
  }) = _EventState;
}


