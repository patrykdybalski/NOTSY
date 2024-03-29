import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ResetPasswordTextInformation(),
            const SizedBox(height: 16),
            EmailTextField(emailController: emailController),
            const SizedBox(height: 24),
            ReserPasswordButton(emailController: emailController),
            const SizedBox(height: 16),
            const BackButtonWidget(),
          ],
        ),
      ),
    );
  }
}
