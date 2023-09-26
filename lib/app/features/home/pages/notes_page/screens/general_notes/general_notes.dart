import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/core/enums.dart';
import 'package:primary_school/app/features/home/pages/notes_page/cubit/note_cubit.dart';
import 'package:primary_school/app/features/home/pages/notes_page/screens/note_reader_screen/note_reader_screen.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';

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
        create: (context) => NoteCubit(
          NoteRepository(),
        )..start(),
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
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
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
                  return BlocProvider(
                    create: (context) => NoteCubit(NoteRepository()),
                    child: BlocBuilder<NoteCubit, NoteState>(
                      builder: (context, state) {
                        return AlertDialog(
                          title: const Text('Usunąć notatkę?'),
                          elevation: 20,
                          backgroundColor: widget.noteModel.color,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Nie',
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<NoteCubit>()
                                    .remove(id: widget.noteModel.id);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Tak',
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }));
          },
          child: Column(
            children: [
              Container(
                height: 200,
                width: 175,
                decoration: BoxDecoration(
                  color: widget.noteModel.color,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      spreadRadius: 0.2,
                      blurRadius: 0.3,
                      offset:
                          const Offset(0.3, 0.3), // Przesunięcie cienia w dół
                    ),
                    // const BoxShadow(
                    //   color: Colors.white,
                    //   spreadRadius: 1,
                    //   blurRadius: 1,
                    //   offset: Offset(-1, -1), // Przesunięcie cienia w dół
                    // ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 8.0,
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
                              style: const TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: 5,
                      ),
                      Expanded(
                        child: Text(
                          widget.noteModel.subtitle,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
