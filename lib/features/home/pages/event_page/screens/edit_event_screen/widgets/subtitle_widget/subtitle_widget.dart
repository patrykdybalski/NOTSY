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
    return Card(
      color: Theme.of(context).colorScheme.primary.withOpacity(1),
      elevation: 0.5,
      surfaceTintColor: Colors.transparent,
      child: TextFormField(
        initialValue: eventModel.subtitle,
        onChanged: onSubtitleChanged,
        keyboardType: TextInputType.multiline,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        maxLines: 10,
        minLines: 4,
        scrollPhysics: const ClampingScrollPhysics(),
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        cursorRadius: const Radius.circular(12),
        style: TextStyles.textStyle1(
          16,
          Theme.of(context).colorScheme.inversePrimary,
        ),
        decoration: InputDecoration(
          enabled: true,
          labelText: 'Szczegóły',
          alignLabelWithHint: true,
          labelStyle: TextStyles.textStyle1(
            16,
            Theme.of(context).colorScheme.inversePrimary,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0.3,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
