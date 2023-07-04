import 'package:flutter/material.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/detailed_notes/detailed_notes.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/general_notes.dart';

import 'package:primary_school/features/home/pages/notes_page/screens/private_notes/private_notes.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

TabController tabController = TabController(length: 3, vsync: this);

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: const TabBar(
            tabs: [
              Text('1'),
              Text('1'),
              Text('1'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GeneralNotes(),
            DetailedNotesScreen(),
            PrivateNotesScreen(),
          ],
        ),
      ),
    );
  }
}
