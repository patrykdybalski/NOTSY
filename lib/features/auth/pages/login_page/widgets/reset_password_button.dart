import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
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
          child: Text(
            'Nie pamiętasz hasła?',
            style: TextStyles.textStyle1(
              14,
              Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
