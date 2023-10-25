import 'package:firebase_auth/firebase_auth.dart';

class LoginAuthDataSource {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
