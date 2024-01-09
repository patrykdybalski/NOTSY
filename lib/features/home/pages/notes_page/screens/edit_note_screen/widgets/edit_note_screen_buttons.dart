import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';

import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';

class EditNoteScreenButtons {
  final BuildContext context;
  final String? title;
  final String? subtitle;
  final DateTime createdDate;
  final DateTime? updatedDate;
  final Color selectedColor;
  final String id;
  final NoteModel noteModel;

  EditNoteScreenButtons({
    required this.context,
    required this.title,
    required this.subtitle,
    required this.createdDate,
    required this.updatedDate,
    required this.selectedColor,
    required this.id,
    required this.noteModel,
  });

  Row buildFabButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildBackButton(),
        buildSaveButton(),
      ],
    );
  }

  FloatingActionButton buildBackButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      mini: true,
      heroTag: null,
      child: Icon(
        Icons.chevron_left_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 34,
      ),
    );
  }

  FloatingActionButton buildSaveButton() {
    return FloatingActionButton(
      onPressed: () {
        final newTitle = title ?? noteModel.title;
        final newSubtitle = subtitle ?? noteModel.subtitle;
        context.read<EditNoteCubit>().edit(
              newTitle,
              newSubtitle,
              createdDate,
              updatedDate!,
              id,
            );
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      heroTag: null,
      mini: true,
      child: Icon(
        Icons.check_outlined,
        color: Theme.of(context).colorScheme.tertiary,
        size: 30,
      ),
    );
  }
}
