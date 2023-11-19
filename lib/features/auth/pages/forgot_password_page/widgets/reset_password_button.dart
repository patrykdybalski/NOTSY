import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/auth/cubit/login_cubit.dart';

class ReserPasswordButton extends StatelessWidget {
  const ReserPasswordButton({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context
            .read<AuthCubit>()
            .resetPasswordd(email: emailController.text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenLogoColor,
      ),
      child: const Text(
        'Zresetuj hasło',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}