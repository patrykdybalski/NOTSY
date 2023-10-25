part of 'user_page_cubit.dart';

@immutable
class UserPageState {
  const UserPageState({
    this.status = Status.initial,
    this.errorMessage = '',
  });
  final Status status;
  final String errorMessage;
}
