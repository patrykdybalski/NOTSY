import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginAuthRepository)
      : super(
          LoginState(),
        );
  final LoginAuthRepository _loginAuthRepository;

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _loginAuthRepository.signInUser(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        LoginState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> createUserAccount(
      {required String email, required String password}) async {
    try {
      await _loginAuthRepository.createUser(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        LoginState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> resetPasswordd({required String email}) async {
    try {
      await _loginAuthRepository.resetPassword(email: email);
      emit(
        LoginState(saved: true),
      );
    } catch (error) {
      emit(
        LoginState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
