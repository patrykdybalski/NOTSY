import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/pages/forgot_password_page/forgot_password_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context).forgetPassword,
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
