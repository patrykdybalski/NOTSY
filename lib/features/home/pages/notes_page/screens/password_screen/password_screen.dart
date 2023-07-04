import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/private_notes/private_notes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  String password = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          const Text(
            'Wprowadź hasło:',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.dayColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              maxLength: 4,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: '****',
                counterText: '',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String enteredPassword = passwordController.text;
              if (enteredPassword == password) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivateNotesScreen()),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Błędne hasło'),
                      content: const Text(
                          'Wprowadzone hasło jest niepoprawne. Spróbuj ponownie.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Zatwierdź'),
          ),
        ],
      ),
    );
  }
}
