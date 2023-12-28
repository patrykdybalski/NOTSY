import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
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
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: TextStyles.textStyle2(24),
        forceMaterialTransparency: true,
        title: const Text(
          'Notatki',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.greenColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddNotePage(),
            fullscreenDialog: true,
          ));
        },
        child: const Icon(
          Icons.note_add_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: const GeneralNotes(),
    );
  }
}
