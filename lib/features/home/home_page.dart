import 'package:flutter/material.dart';
import 'package:primary_school/constans/colors.dart';

import 'package:primary_school/features/home/pages/calendar_page/calendar_page.dart';
import 'package:primary_school/features/home/pages/expenses_page/expenses_page.dart';
import 'package:primary_school/features/home/pages/notes_page/notes_page.dart';

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
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const CalendarPage();
          }
          if (currentIndex == 1) {
            return const NotesPage();
          }
          return const ExpensesPage();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: Colors.white60,
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.calendar_month_outlined,
            ),
            label: 'Plany',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notes_outlined,
            ),
            label: 'Notatki',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money_outlined,
            ),
            label: 'Wydatki',
          ),
        ],
      ),
    );
  }
}

// floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => const AddTaskBarPage(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),