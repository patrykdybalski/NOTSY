import 'package:flutter/material.dart';
import 'package:primary_school/features/add/add_task_bar.dart';
import 'package:primary_school/features/home/pages/calendar_page/calendar_page.dart';
import 'package:primary_school/features/home/pages/expenses_page/expenses_page.dart';
import 'package:primary_school/features/home/pages/notes_page/notes_page.dart';

import 'package:primary_school/features/home/pages/user_page/user_page.dart';

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
        title: const Text('Smart Assistant'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 145, 140, 140),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTaskBarPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Builder(
        builder: (context) {
          if (currentIndex == 0) {
            return const CalendarPage();
          }
          if (currentIndex == 1) {
            return const ExpensesPage();
          }
          return const NotesPage();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff7fab72),
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
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
