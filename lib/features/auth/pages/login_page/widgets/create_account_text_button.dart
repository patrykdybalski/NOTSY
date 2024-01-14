import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:primary_school/features/auth/pages/create_user_page/create_user_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateAccountTextButton extends StatelessWidget {
  const CreateAccountTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.background,
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const CreateUserPage(),
        ));
      },
      child: Text(AppLocalizations.of(context).createAccount,
          style: TextStyles.textStyle1(
            17,
            Theme.of(context).colorScheme.tertiary,
          )),
    );
  }
}
