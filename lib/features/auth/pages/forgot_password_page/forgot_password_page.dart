import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/widgets/email_textfield_widget.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/widgets/reset_password_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Pomyślnie wysłano link! Sprawdź swoją pocztę.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: AppColors.redColor,
                ),
              );
            }
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: AppColors.redColor,
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Zresetuj hasło',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Wprowadź adres email, na który zostanie wysłany link do resetu hasła.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  EmailTextField(
                    emailController: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ReserPasswordButton(
                    emailController: emailController,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
