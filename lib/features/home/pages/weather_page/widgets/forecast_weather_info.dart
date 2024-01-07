import 'package:flutter/material.dart';

class ForecastWeatherInfo extends StatefulWidget {
  const ForecastWeatherInfo({super.key});

  @override
  State<ForecastWeatherInfo> createState() => _ForecastWeatherInfoState();
}

class _ForecastWeatherInfoState extends State<ForecastWeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(.3),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('20 C'),
                  Image.asset(
                    'assets/images/sunny.png',
                    height: 30,
                    width: 20,
                  ),
                  const Text('20/20/20')
                ],
              ),
            );
          }),
    );
  }
}
