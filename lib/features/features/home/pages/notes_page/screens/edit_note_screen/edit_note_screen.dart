import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/features/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';
import 'package:primary_school/features/features/home/pages/notes_page/screens/edit_note_screen/edit_page_buttons.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditNoteCubit>(),
      child: BlocListener<EditNoteCubit, EditNoteState>(
        listener: (context, state) {
          if (state.saved) {
            Navigator.of(context).popUntil((route) => route.isFirst);
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
              floatingActionButton: EditPageButtons(
                      context: context,
                      title: _title,
                      subtitle: _subtitle,
                      createdDate: widget.noteModel.createdDate,
                      updatedDate: updatedDate,
                      selectedColor: widget.noteModel.color,
                      id: widget.id)
                  .buildFabButtons(),
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
      decoration: BoxDecoration(
        color: noteModel.color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextFormField(
              initialValue: noteModel.title,
              onChanged: onTitleChanged,
              autofocus: true,
              minLines: 1,
              maxLines: 4,
              maxLength: 120,
              style: TextStyles.textStyle2(20),
              decoration: const InputDecoration(
                counterText: '',
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor, width: 0.8),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.redColor, width: 1.2),
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
              maxLines: 1000,
              style: TextStyles.textStyle1(16),
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
