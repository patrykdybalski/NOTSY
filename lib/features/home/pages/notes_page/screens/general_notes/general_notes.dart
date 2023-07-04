import 'package:flutter/material.dart';

class GeneralNotes extends StatelessWidget {
  const GeneralNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0c1020),
      body: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white,
            )),
        child: Column(
          children: [
            Container(
              color: Colors.lightBlue,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: const Text("hejo"),
            ),
            Container(
              color: Colors.lightGreen,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: Text("hejo"),
            ),
          ],
        ),
      ),
    );
  }
}
