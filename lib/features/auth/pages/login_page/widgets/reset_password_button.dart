import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/colors.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/forgot_password_page.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ForgotPasswordPage();
            }));
          },
          child: const Text(
            'Nie pamiętasz hasła?',
            style: TextStyle(
              color: AppColors.redColor,
            ),
          ),
        ),
      ],
    );
  }
}
