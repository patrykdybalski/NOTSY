import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/forgot_password_page.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
    required this.isCreatingAccount,
  });

  final bool isCreatingAccount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return const ForgotPasswordPage();
            }));
          },
          child: Text(
            isCreatingAccount == true
                ? ''
                : 'Nie pamiętasz hasła?',
            style: const TextStyle(
              color: AppColors.redColor,
            ),
          ),
        ),
      ],
    );
  }
}