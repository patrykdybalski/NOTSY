import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/cubit/note_cubit.dart';

import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/widgets/note_item.dart';

class DeleteNotesDialog extends StatelessWidget {
  const DeleteNotesDialog({
    super.key,
    required this.widget,
  });

  final NoteItem widget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteCubit>()..start(),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Usunąć notatkę?'),
            titleTextStyle: TextStyles.textStyle2(20),
            elevation: 20,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Nie',
                  style: TextStyles.textStyle2(16),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<NoteCubit>().remove(id: widget.noteModel.id);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Tak',
                  style: TextStyles.textStyle1(16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
