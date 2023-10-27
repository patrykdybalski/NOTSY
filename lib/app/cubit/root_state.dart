part of 'root_cubit.dart';

class RootState {
  final User? user;
  final Status status;
  final String errorMessage;

  RootState({
    required this.user,
    required this.status,
    required this.errorMessage,
  });
}
