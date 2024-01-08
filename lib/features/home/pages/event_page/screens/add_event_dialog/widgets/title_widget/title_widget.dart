import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.onTitleChanged,
  });

  final Function(String?) onTitleChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary.withOpacity(1),
      elevation: 0.5,
      surfaceTintColor: Colors.transparent,
      child: TextFormField(
        onChanged: onTitleChanged,
        autofocus: true,
        keyboardType: TextInputType.text,
        maxLines: 2,
        minLines: 1,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        cursorRadius: const Radius.circular(12),
        style: TextStyles.textStyle2(
          16,
          Theme.of(context).colorScheme.inversePrimary,
        ),
        decoration: InputDecoration(
          labelText: 'Temat',
          labelStyle: TextStyles.textStyle2(
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
