import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   LoginPage({
    super.key,
  });
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Zaloguj się'),
            TextField(
              controller: widget.emailController,
              decoration: const InputDecoration(
                hintText: 'E-mail',
              ),
            ),
            TextField(
              controller: widget.passwordController,
              decoration: const InputDecoration(
                hintText: 'Hasło',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: widget.emailController.text,
                    password: widget.passwordController.text,
                  );
                } catch (error) {

                }
                
              },
              child: const Text('Zaloguj się'),
            ),
          ],
        ),
      ),
    );
  }
}
