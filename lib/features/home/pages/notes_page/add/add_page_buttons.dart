import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:primary_school/constans/colors.dart';
import 'package:primary_school/features/home/pages/notes_page/add/cubit/add_note_cubit.dart';

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

  FloatingActionButton buildColorPickerButton() {
    return FloatingActionButton(
      onPressed: () {
        return colorPickerDialog(context);
      },
      backgroundColor: AppColors.primaryColor,
      mini: true,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.fabGradient,
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  FloatingActionButton buildSaveButton() {
    return FloatingActionButton(
      onPressed: title == null || subtitle == null
          ? null
          : () {
              context.read<AddNoteCubit>().add(
                    title!,
                    subtitle!,
                    createdDate,
                    updatedDate,
                    selectedColor,
                  );
              Navigator.of(context).pop();
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
