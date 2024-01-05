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
