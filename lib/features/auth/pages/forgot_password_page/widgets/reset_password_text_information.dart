import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordTextInformation extends StatelessWidget {
  const ResetPasswordTextInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context).sendResetLink,
          style: TextStyles.textStyle2(
            17,
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocalizations.of(context).giveEmailAddress,
          style: TextStyles.textStyle1(
            13,
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }
}
