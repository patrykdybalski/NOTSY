import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/edit_note_screen.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/general_notes/cubit/note_cubit.dart';

class NoteReaderButtons {
  final BuildContext context;
  final NoteModel noteModel;
  NoteReaderButtons({
    required this.context,
    required this.noteModel,
  });
  Row buildFabButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildBackButton(context),
        buildDeleteButton(context),
        buildEditButton(context),
      ],
    );
  }

  FloatingActionButton buildBackButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      backgroundColor: Theme.of(context).colorScheme.secondary,
      mini: true,
      heroTag: null,
      child: Icon(
        Icons.chevron_left_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 38,
      ),
    );
  }

  FloatingActionButton buildDeleteButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: ((context) {
              return BlocProvider(
                create: (context) => getIt<NoteCubit>(),
                child: BlocBuilder<NoteCubit, NoteState>(
                  builder: (context, state) {
                    return AlertDialog(
                      elevation: 20,
                      title: const Text('Usunąć notatkę?'),
                      titleTextStyle: TextStyles.textStyle2(20),
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
                            context.read<NoteCubit>().remove(id: noteModel.id);
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
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
            }));
      },
      backgroundColor: Theme.of(context).colorScheme.secondary,
      mini: true,
      heroTag: null,
      child: Icon(
        Icons.delete_forever_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 30,
      ),
    );
  }

  FloatingActionButton buildEditButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (builder) => EditNoteScreen(
            noteModel: noteModel,
            id: noteModel.id,
          ),
        ));
      },
      backgroundColor: Theme.of(context).colorScheme.secondary,
      mini: true,
      heroTag: null,
      child: Icon(
        Icons.edit_outlined,
        color: Theme.of(context).colorScheme.tertiary,
        size: 30,
      ),
    );
  }
}
