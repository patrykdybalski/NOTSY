import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';

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
DateTime _updatedDate = DateTime.now();

class _EditNoteScreenState extends State<EditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNoteCubit(NoteRepository()),
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
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    backgroundColor: AppColors.redColor2,
                    heroTag: null,
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
                    heroTag: null,
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
                      if ((_title != null && _title!.isNotEmpty) ||
                          (_subtitle != null && _subtitle!.isNotEmpty)) {
                        final newTitle = _title ?? widget.noteModel.title;
                        final newSubtitle =
                            _subtitle ?? widget.noteModel.subtitle;
                        setState(() {
                          _updatedDate =
                              DateTime.now(); // Zaktualizuj _updatedDate
                        });
                        context.read<EditNoteCubit>().edit(
                              newTitle,
                              newSubtitle,
                              widget.noteModel.createdDate,
                              _updatedDate,
                              widget.id,
                            );
                      }
                    },
                    backgroundColor: AppColors.greenColor,
                    heroTag: null,
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
      decoration: BoxDecoration(
        color: noteModel.color,
        // image: DecorationImage(
        //   image: AssetImage(
        //       'images/note_card.png.jpg'), // Ścieżka do twojego obrazu
        //   fit: BoxFit.cover, // Rozciągnij obraz, aby wypełnić całe tło
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextFormField(
              initialValue: noteModel.title,
              onChanged: onTitleChanged,
              minLines: 1,
              maxLines: 4,
              maxLength: 120,
              style: const TextStyle(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
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
              style: const TextStyle(
                color: AppColors.secondaryColor,
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
