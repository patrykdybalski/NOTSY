part of 'user_drawer_cubit.dart';

@freezed
class UserDrawerState with _$UserDrawerState {
  factory UserDrawerState({
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _UserDrawerState;
}
