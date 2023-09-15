import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/features/home/pages/notes_page/cubit/note_cubit.dart';
import 'package:primary_school/app/features/home/pages/notes_page/screens/edit_note_screen/edit_note_screen.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/domain/models/note_model/note_model.dart';
import 'package:primary_school/domain/repositories/note/note_repository.dart';


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
      backgroundColor: AppColors.redColor2,
      mini: true,
      heroTag: null,
      child: const Icon(
        Icons.chevron_left_outlined,
        color: AppColors.secondaryColor,
        size: 25,
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
                create: (context) => NoteCubit(NoteRepository()),
                child: BlocBuilder<NoteCubit, NoteState>(
                  builder: (context, state) {
                    return AlertDialog(
                      elevation: 20,
                      backgroundColor: noteModel.color,
                      title: const Text('Usunąć notatkę?'),
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
                            context.read<NoteCubit>().remove(id: noteModel.id);
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
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
      backgroundColor: Colors.grey,
      mini: true,
      heroTag: null,
      child: const Icon(
        Icons.delete_forever_outlined,
        color: AppColors.secondaryColor,
        size: 25,
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
      backgroundColor: AppColors.editButton,
      mini: true,
      heroTag: null,
      child: const Icon(
        Icons.edit_outlined,
        color: AppColors.secondaryColor,
        size: 25,
      ),
    );
  }
}

// SpeedDial buildSpeedDialButton(BuildContext context) {
//   return SpeedDial(
//     animatedIcon: AnimatedIcons.menu_close,
//     buttonSize: const Size.square(40.0),
//     backgroundColor: AppColors.secondaryColor,
//     overlayColor: const Color.fromARGB(255, 105, 224, 224),
//     overlayOpacity: 0.3,
//     spacing: 8,
//     closeManually: false,
//     children: [
//       SpeedDialChild(
//         child: const Icon(
//           Icons.mode_edit_outline_outlined,
//         ),
//         label: 'Edytuj',
//         backgroundColor: AppColors.greenColor,
//         onTap: () {
//           Navigator.of(context).push(MaterialPageRoute(
//             builder: (builder) => EditNoteScreen(
//               noteModel: widget.noteModel,
//               id: widget.noteModel.id,
//             ),
//           ));
//           _refreshScreen();
//         },
//       ),
//       SpeedDialChild(
//         child: const Icon(
//           Icons.delete_forever_outlined,
//         ),
//         label: 'Usuń',
//         backgroundColor: const Color.fromARGB(255, 176, 70, 24),
//         onTap: () {
//           context.read<ReaderScreenCubit>().remove(
//                 id: widget.noteModel.id,
//               );
//         },
//       ),
//     ],
//   );
// }
