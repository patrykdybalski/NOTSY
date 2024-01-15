import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      child: Card(
        color: Theme.of(context).colorScheme.primary.withOpacity(1),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      style: GoogleFonts.roboto(
                        color: widget.noteModel.color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).colorScheme.secondary,
                thickness: 0.7,
                height: 1,
              ),
              Expanded(
                child: Text(
                  widget.noteModel.subtitle,
                  overflow: TextOverflow.fade,
                  style: TextStyles.textStyle1(
                    14,
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
