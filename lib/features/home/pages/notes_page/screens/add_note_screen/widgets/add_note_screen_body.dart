import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNoteScreenBody extends StatelessWidget {
  const AddNoteScreenBody({
    super.key,
    required this.onTitleChanged,
    required this.onSubtitleChange,
    required this.selectedColor, // Dodano selectedColor
  });

  final Function(String?) onTitleChanged;
  final Function(String?) onSubtitleChange;
  final Color selectedColor; // Dodano selectedColor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          TextField(
            onChanged: onTitleChanged,
            minLines: 1,
            maxLines: 4,
            maxLength: 120,
            autofocus: true,
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            style: TextStyles.textStyle2(
              18,
              selectedColor,
            ),
            decoration: InputDecoration(
              counterText: '',
              hintText: AppLocalizations.of(context).title,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  width: 0.8,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  width: 0.8,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: onSubtitleChange,
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            minLines: 1,
            maxLines: 200,
            style: TextStyles.textStyle1(
              18,
              Theme.of(context).colorScheme.inversePrimary,
            ),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).enterContentNote,
              border: InputBorder.none,
            ),
          )
        ],
      ),
    );
  }
}
