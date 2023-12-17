import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:primary_school/data/remote_data_sources_firebase/login_auth_data_source.dart';

class LoginAuthRepository {
  LoginAuthRepository(this._loginAuthDataSource);

  final LoginAuthDataSource _loginAuthDataSource;

  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    await _loginAuthDataSource.createUserAccount(
      email: email,
      password: password,
    );
  }

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    await _loginAuthDataSource.signIn(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _loginAuthDataSource.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    await _loginAuthDataSource.passwordResetData(email: email);
  }

  Stream<User?> start() {
    return _loginAuthDataSource.start();
  }
}
