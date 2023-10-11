import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/features/home/pages/notes_page/add/cubit/add_note_cubit.dart';
import 'package:primary_school/app/features/home/pages/notes_page/cubit/note_cubit.dart';

import 'package:primary_school/constans/colors.dart';

class AddPageButtons {
  final BuildContext context;
  final String? title;
  final String? subtitle;
  final DateTime createdDate;
  final DateTime updatedDate;
  Color selectedColor;
  final void Function(BuildContext) colorPickerDialog; // Dodajemy parametr

  AddPageButtons({
    required this.context,
    required this.title,
    required this.subtitle,
    required this.createdDate,
    required this.updatedDate,
    required this.selectedColor,
    required this.colorPickerDialog,
  });

  Widget buildFabButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildBackButton(),
        buildColorPickerButton(),
        buildSaveButton(),
      ],
    );
  }

  FloatingActionButton buildBackButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      backgroundColor: AppColors.primaryColor,
      mini: true,
      heroTag: null,
      child: const Icon(
        Icons.chevron_left_outlined,
        color: AppColors.redColor2,
        size: 30,
      ),
    );
  }

  FloatingActionButton buildColorPickerButton() {
    return FloatingActionButton(
      onPressed: () {
        return colorPickerDialog(context);
      },
      backgroundColor: AppColors.primaryColor,
      mini: true,
      child: const Icon(
        Icons.color_lens_outlined,
        color: AppColors.selectedDayColor,
        size: 25,
      ),
    );
  }

  FloatingActionButton buildSaveButton() {
    return FloatingActionButton(
      onPressed: () {
        final newTitle = title ?? '';
        final newSubtitle = subtitle ?? '';
        context.read<AddNoteCubit>().add(
              newTitle,
              newSubtitle,
              createdDate,
              updatedDate,
              selectedColor,
            );
        context.read<NoteCubit>().start();
      },
      backgroundColor: AppColors.primaryColor,
      heroTag: null,
      mini: true,
      child: const Icon(
        Icons.check_outlined,
        color: AppColors.greenColor,
        size: 25,
      ),
    );
  }
}
