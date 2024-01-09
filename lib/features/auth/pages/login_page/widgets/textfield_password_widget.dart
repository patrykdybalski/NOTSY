import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({
    super.key,
    required this.onPasswordChanged,
  });

  final Function(String?) onPasswordChanged;

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
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
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Container(
        color: Theme.of(context).colorScheme.primary.withOpacity(1),
        child: TextField(
          onChanged: widget.onPasswordChanged,
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          obscuringCharacter: '*',
          cursorColor: Theme.of(context).colorScheme.inversePrimary,
          decoration: InputDecoration(
            focusColor: Colors.amber,
            filled: true,
            hintText: 'Hasło',
            hintStyle: TextStyles.textStyle1(
              16,
              Theme.of(context).colorScheme.inversePrimary,
            ),
            prefixIcon: const Icon(Icons.key),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.amber.shade600
                    : Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye,
              ),
              onPressed: () {
                toggleObscureText();
              },
            ),
            fillColor:
                Theme.of(context).colorScheme.background.withOpacity(0.7),
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
