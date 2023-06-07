import 'package:flutter/material.dart';
import 'package:primary_school/features/TabBarPages/add_task_page.dart';

class AddTaskBarPage extends StatelessWidget {
  const AddTaskBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dodaj:'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 145, 140, 140),
                  Color.fromARGB(255, 145, 140, 140),
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.green,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.yellow,
            labelColor: Colors.amber,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(
                height: 50,
                child: Text(
                  'Zaplanuj',
                ),
              ),
              Tab(
                height: 50,
                child: Text(
                  'Notatka',
                ),
              ),
              Tab(
                height: 50,
                child: Text(
                  'Wydatek',
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const AddTaskPage(),
            Scaffold(
              body: Container(
                decoration: const BoxDecoration(),
                child: const Center(
                  child: Text(
                    'dziala2',
                  ),
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.red,
              body: Container(
                decoration: const BoxDecoration(),
                child: const Center(
                  child: Text(
                    'dziala3',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
