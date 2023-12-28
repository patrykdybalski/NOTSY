import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';

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
          onChanged: onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email),
            prefixIconColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.focused)
                  ? AppColors.greenColor
                  : Colors.grey,
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
