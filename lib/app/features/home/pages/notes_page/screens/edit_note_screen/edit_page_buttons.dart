import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/features/home/pages/notes_page/screens/edit_note_screen/cubit/edit_note_cubit.dart';
import 'package:primary_school/constans/colors.dart';

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
      backgroundColor: AppColors.primaryColor,
      mini: true,
      heroTag: null,
      child: const Icon(
        Icons.chevron_left_outlined,
        color: AppColors.redColor,
        size: 30,
      ),
    );
  }

  FloatingActionButton buildSaveButton() {
    return FloatingActionButton(
      onPressed: () {
        final newTitle = title ?? title;
        final newSubtitle = subtitle ?? subtitle;
        context.read<EditNoteCubit>().edit(
              newTitle!,
              newSubtitle!,
              createdDate,
              updatedDate!,
              id,
            );
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
