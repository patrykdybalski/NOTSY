part of 'edit_event_cubit.dart';

@freezed
class EditEventState with _$EditEventState {
  factory EditEventState({
    @Default(false) bool saved,
    @Default('') errorMessage,
  }) = _EditEventState;
}

