import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextFieldCreatePassword extends StatefulWidget {
  const TextFieldCreatePassword({
    required this.onPasswordChanged,
    super.key,
  });

  final Function(String?) onPasswordChanged;

  @override
  State<TextFieldCreatePassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldCreatePassword> {
  bool obscureText = true;
  // Początkowo hasło jest ukryte
  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText; // Zamienia wartość pomiędzy true i false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: Container(
        color: Theme.of(context).colorScheme.primary.withOpacity(1),
        child: TextField(
          onChanged: widget.onPasswordChanged,
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            focusColor: Colors.amber,
            filled: true,
            fillColor:
                Theme.of(context).colorScheme.background.withOpacity(0.7),
            hintText: AppLocalizations.of(context).password,
            prefixIcon: const Icon(Icons.key),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.amber.shade600
                    : Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(obscureText
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye), // Ikona do przycisku
              onPressed: () {
                toggleObscureText();
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.8),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.1),
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.7),
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.9),
                )),
          ),
        ),
      ),
    );
  }
}
