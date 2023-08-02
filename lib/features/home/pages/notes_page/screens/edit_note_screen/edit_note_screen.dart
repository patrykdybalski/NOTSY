import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/notes_page.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

String? _title;
String? _subtitle;

class _EditNoteScreenState extends State<EditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(NoteRepository()),
      child: BlocListener<EditNoteCubit, EditNoteState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NotesPage()));
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
              ),
              backgroundColor: AppColors.redColor,
            ));
          }
        },
        child: BlocBuilder<EditNoteCubit, EditNoteState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColors.primaryColor,
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    backgroundColor: AppColors.redColor2,
                    mini: true,
                    // shape: BeveledRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    //   side: const BorderSide(
                    //     color: AppColors.secondaryColor,
                    //   ),
                    // ),
                    child: const Icon(
                      Icons.chevron_left_outlined,
                      color: AppColors.secondaryColor,
                      size: 25,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppColors.primaryColor,
                    mini: true,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.fabGradient,
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Map<String, dynamic> updatedFields = {};
                      if (_title != null && _title != widget.noteModel.title) {
                        updatedFields['title'] = _title;
                      }
                      if (_subtitle != null &&
                          _subtitle != widget.noteModel.subtitle) {
                        updatedFields['title'] = _title;
                      }

                      context.read<EditNoteCubit>().edit(
                            updatedFields,
                            widget.noteModel.id,
                          );
                    },
                    backgroundColor: AppColors.greenColor,
                    mini: true,
                    child: const Icon(
                      Icons.check_outlined,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterFloat,
              body: _AddNotePageBody(
                noteModel: widget.noteModel,
                onTitleChanged: (newValue) {
                  setState(() {
                    _title = newValue;
                  });
                },
                onSubtitleChange: (newValue) {
                  setState(() {
                    _subtitle = newValue;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AddNotePageBody extends StatelessWidget {
  const _AddNotePageBody({
    Key? key,
    required this.onTitleChanged,
    required this.onSubtitleChange,
    required this.noteModel,
  }) : super(key: key);

  final Function(String?) onTitleChanged;
  final Function(String?) onSubtitleChange;
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/note_card.png.jpg'), // Ścieżka do twojego obrazu
          fit: BoxFit.cover, // Rozciągnij obraz, aby wypełnić całe tło
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextFormField(
              initialValue: noteModel.title,
              onChanged: onTitleChanged,
              minLines: 1,
              maxLines: 2,
              maxLength: 120,
              style: const TextStyle(
                color: Color.fromARGB(255, 56, 99, 56),
                fontWeight: FontWeight.w700,
              ),
              decoration: const InputDecoration(
                counterText: '',
                hintText: 'Tytuł',
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor, width: 0.8),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 108, 223, 88), width: 1.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor, width: 1.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: noteModel.subtitle,
              onChanged: onSubtitleChange,
              minLines: 1,
              maxLines: 200,
              style: const TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                hintText: 'Wpisz treść notatki',
                border: InputBorder.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
