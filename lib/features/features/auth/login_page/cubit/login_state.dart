part of 'login_cubit.dart';

class LoginState {
  LoginState({
    this.errorMessage = '',
    this.saved = false,
  });
  final String errorMessage;
  final bool saved;
}
