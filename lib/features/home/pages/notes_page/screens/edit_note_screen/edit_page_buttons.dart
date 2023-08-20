import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';

class EditPageButtons {
  final BuildContext context;
  final String? title;
  final String? subtitle;
  final DateTime createdDate;
  final DateTime? updatedDate;
  final Color selectedColor;
  final String id;

  EditPageButtons({
    required this.context,
    required this.title,
    required this.subtitle,
    required this.createdDate,
    required this.updatedDate,
    required this.selectedColor,
    required this.id,
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

  FloatingActionButton buildSaveButton() {
    return FloatingActionButton(
      onPressed: () {
        if ((title != null && title!.isNotEmpty) ||
            (subtitle != null && subtitle!.isNotEmpty)) {
          final newTitle = title ?? title!;
          final newSubtitle = subtitle ?? subtitle!;

          context.read<EditNoteCubit>().edit(
                newTitle,
                newSubtitle,
                createdDate,
                updatedDate!,
                id,
              );
        }
      },
      backgroundColor: AppColors.greenColor,
      heroTag: null,
      mini: true,
      child: const Icon(
        Icons.check_outlined,
        color: AppColors.secondaryColor,
      ),
    );
  }
}
//   void colorPickerDialog() => showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           backgroundColor: AppColors.primaryColor,
//           elevation: 200,
//           contentPadding: const EdgeInsets.all(5.0),
//           actions: [
//             TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.transparent,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(13),
//                   side: const BorderSide(
//                     color: AppColors.greenColor,
//                     width: 0.5,
//                   ),
//                 ),
//               ),
//               child: const Text(
//                 'Wybierz',
//                 style: TextStyle(
//                   color: AppColors.greenColor,
//                   fontSize: 15,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//           content: buildColorPicker(),
//         ),
//       );

//   Widget buildColorPicker() {
//     return BlockPicker(
//         pickerColor: selectedColor,
//         availableColors: AppColors.availableColors,
//         onColorChanged: (newColor) {
//           selectedColor = newColor;
//         });
//   }

//   void setState(Null Function() param0) {}
 
