part of 'user_page_cubit.dart';

@freezed
class UserPageState with _$UserPageState {
  factory UserPageState({
    
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _UserPageState;
}
