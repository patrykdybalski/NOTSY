import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';


@injectable  
class LoginAuthDataSource {
  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }

  Future<void> passwordResetData({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }
  // Stream<User?> authStateStream() {
  //   return FirebaseAuth.instance.authStateChanges();
  // }

  // StreamSubscription<User?> streamSubscriptionData({User? user}) {
  //   final stream = FirebaseAuth.instance.authStateChanges();
  //   return stream.listen((User? user) {

  //   });
  // }
}
