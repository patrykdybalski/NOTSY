import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/features/home/pages/notes_page/cubit/note_cubit.dart';

import '../note_reader_screen/note_reader_screen.dart';


class GeneralNotes extends StatefulWidget {
  const GeneralNotes({super.key});

  @override
  State<GeneralNotes> createState() => _GeneralNotesState();
}

class _GeneralNotesState extends State<GeneralNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider(
        create: (context) => getIt<NoteCubit>()..start(),
        child: BlocBuilder<NoteCubit, NoteState>(
          builder: (context, state) {
            final noteModels = state.noteItems;
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.success:
                return GridView(
                  reverse: false,
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.8,
                  ),
                  children: [
                    for (final noteModel in noteModels) ...[
                      NoteItem(
                        noteModel: noteModel,
                      ),
                    ],
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

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

class DeleteNotesDialog extends StatelessWidget {
  const DeleteNotesDialog({
    super.key,
    required this.widget,
  });

  final NoteItem widget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<NoteCubit>()..start(),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          return AlertDialog(
            title: const Text('Usunąć notatkę?'),
            titleTextStyle: TextStyles.textStyle2(20),
            elevation: 20,
            backgroundColor: widget.noteModel.color,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Nie',
                  style: TextStyles.textStyle1(16),
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
