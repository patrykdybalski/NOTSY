import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Panel użytkownika'),
          backgroundColor: const Color(0xff7fab72),
        ),
        body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'niezalogowany',
              ),
            ]));
  }
}
