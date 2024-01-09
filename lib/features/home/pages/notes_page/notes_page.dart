import 'package:flutter/material.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/add_note_screen/add_note_screen.dart';
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
    return const Scaffold(
      floatingActionButton: AddNotePageButton(),
      body: GeneralNotes(),
    );
  }
}

class AddNotePageButton extends StatelessWidget {
  const AddNotePageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      elevation: 5,
      highlightElevation: 35,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddNoteScreen(),
          fullscreenDialog: true,
          allowSnapshotting: true,
        ));
      },
      child: Icon(
        Icons.note_add_outlined,
        size: 30,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
