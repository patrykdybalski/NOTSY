import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    super.key,
    required this.onSubtitleChanged,
  });

  final Function(String?) onSubtitleChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                blurRadius: 2,
                spreadRadius: 0.5,
                offset: const Offset(1, 2)),
            BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                blurRadius: 0.5,
                offset: const Offset(1, 0))
          ]),
      child: TextFormField(
        onChanged: onSubtitleChanged,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        keyboardType: TextInputType.multiline,
        scrollPhysics: const ClampingScrollPhysics(),
        maxLines: 10,
        minLines: 3,
        cursorColor: AppColors.secondaryColor,
        cursorRadius: const Radius.circular(12),
        style: TextStyles.textStyle1(16),
        decoration: InputDecoration(
          labelText: 'Szczegóły',
          alignLabelWithHint: true,
          labelStyle: TextStyles.textStyle1(16),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 0.6,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
