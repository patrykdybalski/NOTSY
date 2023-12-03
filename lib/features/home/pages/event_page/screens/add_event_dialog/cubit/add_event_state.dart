part of 'add_event_cubit.dart';

@freezed
class AddEventState with _$AddEventState {
  factory AddEventState({
    @Default(false) bool saved,
    @Default('') String errorMessage,
  }) = _AddEventState;
}

// @immutable
// class AddAddEventState {
//   const AddAddEventState({
//     this.saved = false,
//     this.errorMessage = '',
//   });

//   final bool saved;
//   final String errorMessage;
// }
