import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginAuthRepository)
      : super(
          AuthState(),
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
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _loginAuthRepository.signOut();
      emit(
        AuthState(),
      );
    } catch (error) {
      emit(
        AuthState(
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
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> resetPasswordd({required String email}) async {
    try {
      await _loginAuthRepository.resetPassword(email: email);
      emit(
        AuthState(saved: true),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
