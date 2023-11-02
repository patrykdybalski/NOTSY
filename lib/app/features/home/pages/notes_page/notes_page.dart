import 'package:flutter/material.dart';

import 'package:primary_school/app/features/home/pages/notes_page/add/add_note_page.dart';

import 'package:primary_school/app/features/home/pages/notes_page/screens/general_notes/general_notes.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
    with SingleTickerProviderStateMixin {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: TextStyles.headingStyle,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Notatki',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.greenLogoColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AddNotePage(),
            fullscreenDialog: true,
          ));
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: const GeneralNotes(),
    );
  }
}
