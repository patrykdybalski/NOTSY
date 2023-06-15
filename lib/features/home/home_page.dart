import 'package:flutter/material.dart';

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
      backgroundColor: Colors.red,
      // backgroundColor: const Color(0xfff6f3f0),
      // appBar: AppBar(
      //   title: const Text('Smart Assistant'),
      //   centerTitle: true,
      //   backgroundColor: Color(0xff060109),
      //   leading: IconButton(
      //     icon: const Icon(Icons.menu),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (context) => const UserPage(),
      //           ),
      //         );
      //       },
      //       icon: const Icon(
      //         Icons.add_circle_outline_outlined,
      //         size: 35,
      //         color: Color(0xff01D68E),
      //       ),
      //       padding: const EdgeInsets.only(right: 5),
      //     ),
      //   ],
      // ),
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
        backgroundColor: const Color(0xff171b2e),
        selectedItemColor: const Color(0xff01D68E),
        unselectedItemColor: Colors.white,
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