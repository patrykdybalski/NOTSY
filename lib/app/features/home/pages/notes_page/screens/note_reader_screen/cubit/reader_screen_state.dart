part of 'reader_screen_cubit.dart';

@immutable
class ReaderScreenState {
  const ReaderScreenState({
    this.delete = false,
    this.errorMessage = '',
  });
  final bool delete;
  final String errorMessage;
}
