import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

DateTime _selectedDate = DateTime.now();

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Kwiecień 26, 2023',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Today',
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey,
                    ),
                    child: const Center(child: Text('gekee')),
                  ),
                )
              ],
            ),
          ),
          const ItemContainer(),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 15,
            ),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.blueGrey,
              dayTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 13,
                ),
              ),
              dateTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              monthTextStyle: GoogleFonts.lato(
                textStyle: const TextStyle(
                  fontSize: 10,
                ),
              ),
              onDateChange: (date) {
                _selectedDate = date;
              },
            ),
          ),
        ]),
      ),
    );
  }
}




class ItemContainer extends StatelessWidget {
  const ItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(4, 6),
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(),
            ],
          ),
        ],
      ),
    );
  }
}
