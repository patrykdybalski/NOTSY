import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Zaloguj się'),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'E-mail',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Hasło',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.toString(),
                  password: passwordController.toString(),
                );
              },
              child: const Text('Zaloguj się'),
            ),
          ],
        ),
      ),
    );
  }
}
