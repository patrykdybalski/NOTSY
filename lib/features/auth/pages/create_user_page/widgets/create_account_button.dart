import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:primary_school/features/auth/pages/create_user_page/create_user_page.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key, required this.createUserPage});
  final CreateUserPage createUserPage;
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
              context.read<AuthCubit>().createUserAccount(
                    email: createUserPage.emailController.text,
                    password: createUserPage.passwordController.text,
                  );
            },
            child: const Text(
              'Zarejestruj się',
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
