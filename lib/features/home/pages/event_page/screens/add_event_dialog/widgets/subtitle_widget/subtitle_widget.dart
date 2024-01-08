import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    super.key,
    required this.onSubtitleChanged,
  });

  final Function(String?) onSubtitleChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withOpacity(1),
      elevation: 0.5,
      surfaceTintColor: Colors.transparent,
      child: TextFormField(
        onChanged: onSubtitleChanged,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        keyboardType: TextInputType.multiline,
        scrollPhysics: const ClampingScrollPhysics(),
        maxLines: 10,
        minLines: 3,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        cursorRadius: const Radius.circular(12),
        style: TextStyles.textStyle1(
          16,
          Theme.of(context).colorScheme.inversePrimary,
        ),
        decoration: InputDecoration(
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
