import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

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
        'Wróć',
        style: TextStyles.textStyle2(
          17,
          Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
