import 'package:flutter/material.dart';
import 'package:primary_school/features/home/pages/weather_page/widgets/search_widget.dart';

class InitialWeatherScreen extends StatelessWidget {
  const InitialWeatherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
        child: Column(
          children: [
            Container(
              height: 320,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.outline.withOpacity(0.7),
                    Theme.of(context)
                        .colorScheme
                        .outlineVariant
                        .withOpacity(0.7),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topLeft,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade100,
                    blurRadius: 1,
                    offset: const Offset(1, 0),
                  )
                ],
              ),
              child: Image.asset(
                'assets/images/initIcon.png',
              ),
            ),
            SearchWidget(),
          ],
        ),
      ),
    );
  }
}
