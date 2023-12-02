part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
   @Default('')   String errorMessage,
  
   @Default(false)  bool saved,
  }) = _AuthState;
}

