import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/home/pages/notes_page/screens/add_note_page/cubit/add_note_cubit.dart';

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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      mini: true,
      heroTag: null,
      child: Icon(
        Icons.chevron_left_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 34,
      ),
    );
  }

  FloatingActionButton buildColorPickerButton() {
    return FloatingActionButton(
      onPressed: () {
        return colorPickerDialog(context);
      },
      backgroundColor: Theme.of(context).colorScheme.secondary,
      mini: true,
      child: Icon(
        Icons.color_lens_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 30,
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
      },
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
