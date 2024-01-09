import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class TextFieldCreateEmail extends StatelessWidget {
  const TextFieldCreateEmail({
    required this.onEmailChanged,
    super.key,
  });

  final Function(String?) onEmailChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 10),
      child: Container(
        color: Theme.of(context).colorScheme.primary.withOpacity(1),
        child: TextField(
          onChanged: onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor:
                Theme.of(context).colorScheme.background.withOpacity(0.7),
            hintText: 'Email',
            hintStyle: TextStyles.textStyle1(
              16,
              Theme.of(context).colorScheme.inversePrimary,
            ),
            prefixIcon: const Icon(Icons.email),
            prefixIconColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.focused)
                  ? Theme.of(context).colorScheme.tertiary
                  : Colors.grey,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.1),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.1),
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.9),
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.7),
                )),
          ),
        ),
      ),
    );
  }
}
