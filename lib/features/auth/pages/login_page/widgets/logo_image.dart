import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/images/logo@1.png'),
          height: 70,
        ),
        const SizedBox(height: 6),
        Text(
          'NOTSY',
          style: TextStyles.appBarStyle1(
            38,
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            Icon(
              Icons.waving_hand_outlined,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 40,
            ),
            const SizedBox(height: 6),
            Text(
              AppLocalizations.of(context).login,
              style: TextStyles.textStyle2(
                22,
                Theme.of(context).colorScheme.tertiary,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
