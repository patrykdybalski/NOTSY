import 'package:flutter/material.dart';
import 'package:primary_school/app/constans/fonts_style.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leadnig;
  final void Function()? onTap;
  const DrawerTile({
    super.key,
    required this.title,
    required this.leadnig,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyles.textStyle2(18),
        ),
        leading: leadnig,
        onTap: onTap,
      ),
    );
  }
}
