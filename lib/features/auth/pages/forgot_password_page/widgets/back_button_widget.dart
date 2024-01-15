import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        AppLocalizations.of(context).back,
        style: TextStyles.textStyle2(
          16,
          Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
