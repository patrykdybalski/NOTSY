import 'package:flutter/material.dart';
import 'package:primary_school/app/features/page/first_page/first_page.dart';
import 'package:primary_school/app/features/page/fourth_page/fourth_page.dart';
import 'package:primary_school/app/features/page/second_page/second_page.dart';
import 'package:primary_school/app/features/page/third_page/third_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f3f0),
      appBar: AppBar(
        title: const Text('Kocham Ewe'),
        backgroundColor: const Color(0xff7fab72),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const FirstPage();
        }
        if (currentIndex == 1) {
          return const SecondPage();
        }
        if (currentIndex == 2) {
          return const ThirdPage();
        }

        return const FourthPage();
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff7fab72),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Plany',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            label: 'Wydatki',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_outlined),
            label: 'Zdrowie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_sharp),
            label: 'Notatki',
          ),
        ],
      ),
    );
  }
}
