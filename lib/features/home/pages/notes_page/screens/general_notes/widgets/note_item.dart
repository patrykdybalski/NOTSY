import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/widgets/delete_notes_dialog.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/note_reader_screen/note_reader_screen.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({
    required this.noteModel,
    super.key,
  });

  final NoteModel noteModel;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NoteReaderScreen(
              noteModel: widget.noteModel,
            ),
          ),
        );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: ((context) {
            return DeleteNotesDialog(
              widget: widget,
            );
          }),
        );
      },
      child: Container(
        height: 200,
        width: 175,
        decoration: BoxDecoration(
          color: widget.noteModel.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              spreadRadius: 0.2,
              blurRadius: 0.3,
              offset: const Offset(0.3, 0.3), // Przesunięcie cienia w dół
            ),
          ],
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.noteModel.title,
                      maxLines: 4,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.textStyle2(12),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppColors.secondaryColor,
                thickness: 0.5,
                height: 5,
              ),
              Expanded(
                child: Text(
                  widget.noteModel.subtitle,
                  overflow: TextOverflow.fade,
                  style: TextStyles.textStyle1(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}