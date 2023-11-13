part of 'add_event_cubit.dart';

@immutable
class AddEventState {
  const AddEventState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
