import 'package:flutter/material.dart';
import 'package:primary_school/app/features/home/pages/notes_page/add/add_note_page.dart';
import 'package:primary_school/app/features/home/pages/notes_page/screens/general_notes/general_notes.dart';
import 'package:primary_school/constans/colors.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  bool isPasswordRequired = false;
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Notatki',
          style: TextStyle(
            color: AppColors.secondaryColor,
            letterSpacing: 2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout_outlined,
              size: 30,
              color: AppColors.redColor2,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.redColor,
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
