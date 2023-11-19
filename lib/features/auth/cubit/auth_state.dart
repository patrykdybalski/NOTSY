part of 'auth_cubit.dart';

class AuthState {
  AuthState({
    this.errorMessage = '',
    this.saved = false,
  });
  final String errorMessage;
  final bool saved;
}
