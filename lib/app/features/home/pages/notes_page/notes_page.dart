import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/features/home/pages/notes_page/add/add_note_page.dart';
import 'package:primary_school/app/features/home/pages/notes_page/cubit/note_cubit.dart';
import 'package:primary_school/app/features/home/pages/notes_page/screens/general_notes/general_notes.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/constans/font_style.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

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
    return BlocProvider(
      create: (context) => NoteCubit(NoteRepository()),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.primaryColor,
              title: const Text(
                'Notatki',
              ),
              titleTextStyle: TextStyles.headingStyle,
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
        },
      ),
    );
  }
}
