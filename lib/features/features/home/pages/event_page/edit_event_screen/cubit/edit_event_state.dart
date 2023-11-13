part of 'edit_event_cubit.dart';

class EditEventState {
  EditEventState({
    this.saved = false,
    this.errorMessage = '',
  });
  final bool saved;
  final String errorMessage;
}
