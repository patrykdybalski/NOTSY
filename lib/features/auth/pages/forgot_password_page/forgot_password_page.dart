import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/app/injection_container.dart';
import 'package:primary_school/features/auth/cubit/auth_cubit.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/widgets/back_button_widget.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/widgets/email_textfield_widget.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/widgets/reset_password_button.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/widgets/reset_password_text_information.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Pomyślnie wysłano link! Sprawdź swoją pocztę.',
                    style: TextStyle(
                      color: TextStyles.textStyle1(
                        14,
                        Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
              );
            }
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage,
                    style: TextStyles.textStyle1(
                      14,
                      Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ResetPasswordTextInformation(),
                  const SizedBox(height: 16),
                  EmailTextField(emailController: emailController),
                  const SizedBox(height: 32),
                  ReserPasswordButton(emailController: emailController),
                  const SizedBox(height: 16),
                  const BackButtonWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
