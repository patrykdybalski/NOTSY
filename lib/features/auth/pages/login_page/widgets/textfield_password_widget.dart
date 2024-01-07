import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0, 1.0),
              color: Colors.grey.withOpacity(0.2),
            )
          ],
        ),
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
            prefixIcon: const Icon(Icons.key),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.amber
                    : Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(obscureText
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye), // Ikona do przycisku
              onPressed: () {
                toggleObscureText();
              },
            ),
            fillColor: Theme.of(context).colorScheme.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
