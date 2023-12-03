part of 'event_cubit.dart';

@freezed
class EventState with _$EventState {
 
  factory EventState({
    @Default([]) List<EventModel> calendarItems,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _EventState;
}



// @immutable
// class EventState {
//   const EventState(
//     {this.calendarItems = const [],
//     this.status = Status.initial,
//     this.errorMessage,}
//   );
//   final List<EventModel> calendarItems;
//   final Status status;
//   final String? errorMessage;
// }
