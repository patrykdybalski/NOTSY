import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/auth/cubit/login_cubit.dart';
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
                  backgroundColor: AppColors.greenLogoColor,
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
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Podaj swój adres email, otrzymasz link do resetu hasła.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
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
                    child: EmailTextField(emailController: emailController),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180.0),
                    child:
                        ReserPasswordButton(emailController: emailController),
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
