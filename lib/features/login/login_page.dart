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
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się'),
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
          Text(errorMessage),
          ElevatedButton(
            onPressed: () async {
              if (isCreatingAccount == true) {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: widget.emailController.text,
                    password: widget.passwordController.text,
                  );
                } catch (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                }
              } else {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: widget.emailController.text,
                    password: widget.passwordController.text,
                  );
                } catch (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                }
              }
            },
            child: Text(
                isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się '),
          ),
          if (isCreatingAccount == false) ...[
            TextButton(
              onPressed: () {
                setState(() {
                  isCreatingAccount = true;
                });
              },
              child: const Text(
                'Utwórz konto',
              ),
            ),
          ],
          if (isCreatingAccount == true) ...[
            TextButton(
              onPressed: () {
                setState(() {
                  isCreatingAccount = false;
                });
              },
              child: const Text(
                'Masz już konto?',
              ),
            ),
          ]
        ]),
      ),
    );
  }
}
