import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EditSubtitleWidget extends StatelessWidget {
  const EditSubtitleWidget({
    super.key,
    required this.eventModel,
    required this.onSubtitleChanged,
  });

  final EventModel eventModel;
  final Function(String? p1) onSubtitleChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(1, 2)),
            BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                blurRadius: 0.5,
                offset: const Offset(1, 0))
          ]),
      child: TextFormField(
        initialValue: eventModel.subtitle,
        onChanged: onSubtitleChanged,
        keyboardType: TextInputType.multiline,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        maxLines: 10,
        minLines: 4,
        scrollPhysics:
            const ClampingScrollPhysics(), // Dodaj to, aby umożliwić przewijanie
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        cursorRadius: const Radius.circular(12),

        style: TextStyles.textStyle1(16),
        decoration: InputDecoration(
          enabled: true,
          labelText: 'Szczegóły',
          alignLabelWithHint: true,
          labelStyle: TextStyles.textStyle1(16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 0.3,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
