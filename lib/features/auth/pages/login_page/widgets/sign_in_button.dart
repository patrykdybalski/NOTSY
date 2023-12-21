import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.emailController,
    required this.passwordController,
    super.key,
   
  });

  final TextEditingController emailController;
   final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.greenLogoColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              minimumSize: const Size(280, 40),
            ),
            onPressed: () async {
              context.read<AuthCubit>().signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
            },
            child: const Text(
              'Zaloguj się ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
