import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

class EditTitleWidget extends StatelessWidget {
  const EditTitleWidget({
    super.key,
    required this.eventModel,
    required this.onTitleChanged,
  });

  final EventModel eventModel;
  final Function(String? p1) onTitleChanged;

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
        textAlign: TextAlign.justify,
        initialValue: eventModel.title,
        onChanged: onTitleChanged,
        autofocus: true,
        maxLines: 2,
        minLines: 1,
        keyboardType: TextInputType.text,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        cursorRadius: const Radius.circular(12),
        style: TextStyles.textStyle2(
          16,
          Theme.of(context).colorScheme.inversePrimary,
        ),
        decoration: InputDecoration(
          labelText: 'Tytuł',
          labelStyle: TextStyles.textStyle2(
            16,
            Theme.of(context).colorScheme.inversePrimary,
          ),
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
