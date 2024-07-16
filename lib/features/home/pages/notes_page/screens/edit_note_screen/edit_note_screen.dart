import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/widgets/edit_note_screen_buttons.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    super.key,
    required this.noteModel,
    required this.id,
  });
  final NoteModel noteModel;
  final String id;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

String? _title;
String? _subtitle;
final DateTime updatedDate = DateTime.now();

class _EditNoteScreenState extends State<EditNoteScreen> {
  void startNewNote() {
    setState(() {
      _title = null;
      _subtitle = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditNoteCubit>(),
      child: BlocConsumer<EditNoteCubit, EditNoteState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            startNewNote(); // Zerowanie pól po zapisaniu
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
                style: TextStyles.appBarStyle1(
                  14,
                  Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            floatingActionButton: EditNoteScreenButtons(
                    context: context,
                    title: _title,
                    subtitle: _subtitle,
                    createdDate: widget.noteModel.createdDate,
                    updatedDate: updatedDate,
                    selectedColor: widget.noteModel.color,
                    id: widget.id,
                    noteModel: widget.noteModel)
                .buildFabButtons(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            body: _EditNotePageBody(
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
    );
  }
}

class _EditNotePageBody extends StatelessWidget {
  const _EditNotePageBody({
    required this.onTitleChanged,
    required this.onSubtitleChange,
    required this.noteModel,
  });

  final Function(String?) onTitleChanged;
  final Function(String?) onSubtitleChange;
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextFormField(
              initialValue: noteModel.title,
              onChanged: onTitleChanged,
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              autofocus: true,
              minLines: 1,
              maxLines: 4,
              maxLength: 120,
              style: GoogleFonts.roboto(
                color: noteModel.color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                counterText: '',
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 0.8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 0.8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              initialValue: noteModel.subtitle,
              onChanged: onSubtitleChange,
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              minLines: 1,
              maxLines: 1000,
              style: TextStyles.textStyle1(
                18,
                Theme.of(context).colorScheme.inversePrimary,
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
