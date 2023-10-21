import 'package:flutter/material.dart';
import 'package:primary_school/app/features/auth/login_page.dart';
import 'package:primary_school/constans/colors.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({
    super.key,
    required this.widget,
  });

  final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(1.5, 1.5),
              color: Colors.grey.withOpacity(0.2),
            )
          ],
        ),
        child: TextField(
          controller: widget.emailController,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            hintText: 'E-mail',
            prefixIcon: const Icon(Icons.email),
            prefixIconColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.focused)
                  ? AppColors.greenLoginColor
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
                color: AppColors.greenLoginColor,
                width: 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    super.key,
    required this.widget,
  });

  final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(0, 1.5),
              color: Colors.grey.withOpacity(0.2),
            )
          ],
        ),
        child: TextField(
          controller: widget.passwordController,
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: InputDecoration(
            focusColor: Colors.amber,
            filled: true,
            hintText: 'Hasło',
            prefixIcon: const Icon(Icons.key),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.amber
                    : Colors.grey),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.greenLoginColor,
                width: 0.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
