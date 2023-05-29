import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('appbar'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.accessibility_rounded,
                ),
              ),
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.black,
                  ],
                ),
              ),
            ),
            bottom: const TabBar(
                indicatorColor: Colors.yellow,
                unselectedLabelColor: Colors.blue,
                tabs: [
                  Tab(
                    icon: Icon(Icons.one_k),
                    text: 'Dodaj plan',
                  ),
                  Tab(
                    icon: Icon(Icons.one_k),
                    text: 'Dodaj plan',
                  ),
                  Tab(
                    icon: Icon(Icons.one_k),
                    text: 'Dodaj plan',
                  ),
                  Tab(
                    icon: Icon(Icons.one_k),
                    text: 'Dodaj plan',
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              Scaffold(
                  body: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                  right: 20,
                ),
                child: Column(
                  children: [
                    const Text(
                      'tytuł',
                    ),
                  ],
                ),
              )),
              Scaffold(
                body: Container(
                  child: const Center(
                    child: Text('dziala2'),
                  ),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.red,
                body: Container(
                  child: const Center(
                    child: Text('dziala3'),
                  ),
                ),
              ),
              Scaffold(
                body: Container(
                  child: const Center(
                    child: Text('dziala4'),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
