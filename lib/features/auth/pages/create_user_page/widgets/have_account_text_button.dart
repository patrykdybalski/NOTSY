import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

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
      child: Text('Mam już konto',
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