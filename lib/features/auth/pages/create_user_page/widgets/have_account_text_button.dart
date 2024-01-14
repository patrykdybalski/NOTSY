import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HaveAccountTextButton extends StatelessWidget {
  const HaveAccountTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Text(AppLocalizations.of(context).iHaveAccount,
          style: TextStyles.textStyle1(
            17,
            Theme.of(context).colorScheme.tertiary,
          )),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
