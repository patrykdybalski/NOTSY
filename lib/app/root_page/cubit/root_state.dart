part of 'root_cubit.dart';

class RootState {
  final User? user;
   bool isLoadnig = false;
  final String errorMessage;

  RootState({
    required this.user,
    required this.isLoadnig,
    required this.errorMessage,
  });
}
