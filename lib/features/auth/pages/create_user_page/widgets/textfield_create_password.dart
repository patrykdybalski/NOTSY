import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';

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
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(0, 1.0),
              color: Colors.grey.withOpacity(0.4),
            )
          ],
        ),
        child: TextField(
          onChanged: widget.onPasswordChanged,
          keyboardType: TextInputType.text,
          obscureText: obscureText,
          obscuringCharacter: '*',
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
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.greenColor,
                width: 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
