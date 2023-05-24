import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FourthPage
 extends StatelessWidget {
  const FourthPage
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text(
              'niezalogowany',
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child:  const Text(
                'Wyloguj',
              ),
            ),
          ],
    )
    );
  }
}
