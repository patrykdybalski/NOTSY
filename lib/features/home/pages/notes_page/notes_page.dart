import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0c1020),
      appBar: AppBar(
        title: const Text('Notatnik'),
        centerTitle: true,
        backgroundColor: const Color(0xff0c1020),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              size: 35,
              color: Color(0xff2693f9),
            ),
            padding: const EdgeInsets.only(right: 5),
          ),
        ],
      ),
    );
  }
}
