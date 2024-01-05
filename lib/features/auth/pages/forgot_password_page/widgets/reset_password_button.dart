import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';

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
        context.read<AuthCubit>().resetPasswordd(email: emailController.text);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        elevation: 2,
        minimumSize: const Size(350, 50),
      ),
      child: Text(
        'Wyślij link',
        style: TextStyles.textStyle2(
          16,
          Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
