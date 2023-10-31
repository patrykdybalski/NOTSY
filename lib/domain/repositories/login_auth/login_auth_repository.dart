import 'dart:async';

import 'package:primary_school/data/remote_data_sources/login_auth_data_source.dart';

class LoginAuthRepository {
  LoginAuthRepository(this._loginAuthDataSource);

  final LoginAuthDataSource _loginAuthDataSource;

  Future<void> createUsers({
    required String email,
    required String password,
  }) async {
    await _loginAuthDataSource.createUser(
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

  // StreamSubscription<User?> streamSubscription({User? user}) {
  //   return _loginAuthDataSource.streamSubscriptionData(user: user);
  // }
}
