import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/constans/colors.dart';

import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/note_reader_screen/cubit/reader_screen_cubit.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => (ReaderScreenCubit(NoteRepository())),
      child: BlocBuilder<ReaderScreenCubit, ReaderScreenState>(
        builder: (context, state) {
          if (state.delete) {
            Navigator.of(context).pop();
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                ),
                backgroundColor: AppColors.redColor,
              ),
            );
          }
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.primaryColor,
              elevation: 0.6,
              shadowColor: Colors.black,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/note_card.png.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Expanded(
                child: RichText(
                  maxLines: 3,
                  text: TextSpan(
                    text: widget.noteModel.title.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<ReaderScreenCubit>().remove(
                          id: widget.noteModel.id,
                        );
                  },
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(
                    Icons.delete_forever_outlined,
                    color: AppColors.redColor,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(
                    Icons.mode_edit_outline_outlined,
                    color: AppColors.accentColor,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(
                    Icons.keyboard_return_outlined,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/note_card.png.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Utworzenie  23/07/2023',
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                              ),
                            ),
                            Text(
                              'Aktualizacja 23/07/2023',
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Text(
                        widget.noteModel.subtitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
