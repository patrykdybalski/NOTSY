import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:primary_school/features/auth/pages/login_page/login_page.dart';

class SignInOrCreateAccountButton extends StatelessWidget {
  const SignInOrCreateAccountButton({
    super.key,
    required this.isCreatingAccount,
    required this.widget,
  });

  final bool isCreatingAccount;
  final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenLogoColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(
          280,
          40,
        ),
      ),
      onPressed: () async {
        if (isCreatingAccount == true) {
          context.read<AuthCubit>().createUserAccount(
                email: widget.emailController.text,
                password: widget.passwordController.text,
              );
        } else {
          context.read<AuthCubit>().signIn(
                email: widget.emailController.text,
                password: widget.passwordController.text,
              );
        }
      },
      child: Text(
        isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się ',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}