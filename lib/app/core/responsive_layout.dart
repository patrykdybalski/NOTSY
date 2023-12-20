import 'package:flutter/widgets.dart';
 
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.ultrawide,
    required this.wide,
    required this.narrow,
  });

  final Widget ultrawide;
  final Widget wide;
  final Widget narrow;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        if (maxWidth > 1200) {
          return ultrawide;
        } else if (maxWidth > 600) {
          return wide;
        } else {
          return narrow;
        }
      },
    );
  }
}

//too implement in future
