


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/cubit/edit_event_cubit.dart';
import 'package:primary_school/features/home/pages/event_page/screens/edit_event_screen/edit_event_screen.dart';

class SaveEditButton extends StatelessWidget {
  const SaveEditButton({
    super.key,
    required String? title,
    required this.widget,
    required String? subtitle,
    required DateTime? selectedDay,
    required DateTime? selectedTime,
  })  : _title = title,
        _subtitle = subtitle,
        _selectedDay = selectedDay,
        _selectedTime = selectedTime;

  final String? _title;
  final EditEventScreen widget;
  final String? _subtitle;
  final DateTime? _selectedDay;
  final DateTime? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final newTitle = _title ?? widget.eventModel.title;
        final newSubtitle = _subtitle ?? widget.eventModel.subtitle;
        final newSelectedDay = _selectedDay ?? widget.eventModel.selectedDay;
        final newSelectedTime = _selectedTime ?? widget.eventModel.selectedTime;
        context.read<EditEventCubit>().edit(
              newTitle,
              newSubtitle,
              newSelectedDay,
              newSelectedTime,
              widget.eventModel.id,
            );
      },
      child: Text(
        'Zapisz edycję',
        style: GoogleFonts.domine(
          color: AppColors.greenColor,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}