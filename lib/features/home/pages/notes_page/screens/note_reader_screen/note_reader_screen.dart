import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/edit_note_screen.dart';
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
      create: (context) => ReaderScreenCubit(NoteRepository()),
      child: BlocListener<ReaderScreenCubit, ReaderScreenState>(
        listener: (context, state) {
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
        },
        child: BlocBuilder<ReaderScreenCubit, ReaderScreenState>(
          builder: (context, state) {
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
                      Navigator.of(context).pop();
                    },
                    backgroundColor: AppColors.redColor2,
                    mini: true,
                    child: const Icon(
                      Icons.chevron_left_outlined,
                      color: AppColors.secondaryColor,
                      size: 25,
                    ),
                  ),
                  SpeedDial(
                    animatedIcon: AnimatedIcons.menu_close,
                    buttonSize: const Size.square(40.0),
                    backgroundColor: AppColors.secondaryColor,
                    overlayColor: const Color.fromARGB(255, 105, 224, 224),
                    overlayOpacity: 0.3,
                    spacing: 8,
                    closeManually: false,
                    children: [
                      SpeedDialChild(
                        child: const Icon(
                          Icons.mode_edit_outline_outlined,
                        ),
                        label: 'Edytuj',
                        backgroundColor: AppColors.greenColor,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => EditNoteScreen(
                              noteModel: widget.noteModel,
                            ),
                          ));
                        },
                      ),
                      SpeedDialChild(
                        child: const Icon(
                          Icons.delete_forever_outlined,
                        ),
                        label: 'Usuń',
                        backgroundColor: const Color.fromARGB(255, 176, 70, 24),
                        onTap: () {
                          context.read<ReaderScreenCubit>().remove(
                                id: widget.noteModel.id,
                              );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/note_card.png.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                'utw. ${DateFormat('dd/MM/yyyy hh:mm').format(widget.noteModel.createdDate)}',
                                style: const TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 9,
                                ),
                              ),
                              Text(
                                'upd. ${DateFormat('dd/MM/yyyy hh:mm').format(widget.noteModel.updatedDate)}',
                                style: const TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Expanded(
                        child: Text(
                          widget.noteModel.subtitle,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
