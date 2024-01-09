import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class ResetPasswordTextInformation extends StatelessWidget {
  const ResetPasswordTextInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Wyślij link do resetu hasła',
              style: TextStyles.textStyle2(
                26,
                Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Podaj adres e-mail powiązany z kontem',
              style: TextStyles.textStyle1(
                17,
                Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
