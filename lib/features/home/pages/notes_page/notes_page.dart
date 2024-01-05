import 'package:flutter/material.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/add_note_page/add_note_page.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/general_notes.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddNotePage(),
            fullscreenDialog: true,
            allowSnapshotting: true,
          ));
        },
        child: Icon(
          Icons.note_add_outlined,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: const GeneralNotes(),
    );
  }
}
