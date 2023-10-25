import 'package:primary_school/data/remote_data_sources/login_auth_data_source.dart';

class LoginAuthRepository {
  LoginAuthRepository(this._loginAuthDataSource);
  final LoginAuthDataSource _loginAuthDataSource;

  Future<void> signOut() async {
    await _loginAuthDataSource.signOut();
  }
}
