import 'package:flutter/material.dart';

import '../../../../../app/constans/fonts_style.dart';

class LogoImageName extends StatelessWidget {
  const LogoImageName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage('assets/images/logo@1.png'),
          height: 100,
        ),
        const SizedBox(height: 6),
        Text(
          'HOOKIT.',
          style: TextStyles.appBarStyle1(
            34,
            Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            Icon(
              Icons.group_add_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 40,
            ),
            const SizedBox(height: 6),
            Text(
              'Uwtórz konto!',
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
