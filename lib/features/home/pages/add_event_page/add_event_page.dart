import 'package:flutter/material.dart';
import 'package:primary_school/domain/models/event_model/event_model.dart';

import 'package:primary_school/domain/models/input_field.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({
    super.key,
  });

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDescriptionController = TextEditingController();
  late Map<DateTime, List<EventModel>> selectedEvents;
  DateTime selectedDay = DateTime.now();
  List<EventModel> _getEventsfromDay(DateTime day) {
    return selectedEvents[day] ?? [];
  }

  var valueOne = false;
  var valueTwo = false;

  @override
  void dispose() {
    eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      titlePadding: const EdgeInsets.all(1),
      contentPadding: const EdgeInsets.all(10),
      backgroundColor: const Color(0xff0c1020),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: const Text(
              'Anuluj',
              style: TextStyle(
                color: Color.fromARGB(181, 255, 139, 128),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              'Dodaj',
              style: TextStyle(
                color: Color(0xff01D68E),
              ),
            ),
            onPressed: () {
              if (eventNameController.text.isEmpty) {
              } else {
                if (selectedEvents[selectedDay] != null) {
                  selectedEvents[selectedDay]?.add(EventModel(
                      title: eventNameController.text,
                      subtitle: eventDescriptionController.text));
                } else {
                  selectedEvents[selectedDay] = [
                    EventModel(
                        title: eventNameController.text,
                        subtitle: eventDescriptionController.text)
                  ];
                }
              }
              Navigator.of(context).pop();
              eventNameController.clear();
              setState(() {});
              return;
            },
          ),
        ],
      ),
      content: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextFormField(
              autofocus: true,
              cursorColor: Colors.white10,
              cursorRadius: const Radius.circular(12),
              controller: eventNameController,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 212, 209, 209),
              ),
              decoration: InputDecoration(
                labelText: 'Temat',
                labelStyle: const TextStyle(
                  color: Colors.white60,
                  fontSize: 18,
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white10,
              ),
              keyboardType: TextInputType.text,
              maxLength: 40,
              maxLines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Szczegółowy opis',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.white10,
                      cursorRadius: const Radius.circular(12),
                      controller: eventDescriptionController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              cursorColor: Colors.white10,
              cursorRadius: const Radius.circular(12),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.calendar_month_outlined,
                ),
                prefixIconColor: Colors.white70,
                // labelText: 'Wybrana data z kalendarza',
                // labelStyle: const TextStyle(
                //   color: Colors.white60,
                //   fontWeight: FontWeight.normal,
                // ),

                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white10,
              ),
            ),
            Column(
              children: [
                CheckboxListTile(
                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(1),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    'Dodaj godzinę',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  value: valueOne,
                  onChanged: (value) {
                    setState(
                      () {
                        valueOne = value!;
                      },
                    );
                  },
                ),
                CheckboxListTile(
                  activeColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(1),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    'Dodaj powiadomienie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  value: valueTwo,
                  onChanged: (value) {
                    setState(
                      () {
                        valueTwo = value!;
                      },
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MyInputFields(
                    title: 'Początek',
                    hint: '12:00',
                    widget: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyInputFields(
                    title: 'Koniec',
                    hint: '13:00',
                    widget: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

// title() {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       TextButton(
//         child: const Text(
//           'Anuluj',
//           style: TextStyle(
//             color: Color.fromARGB(181, 255, 139, 128),
//           ),
//         ),
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//       ),
//       TextButton(
//         child: const Text(
//           'Dodaj',
//           style: TextStyle(
//             color: Color(0xff01D68E),
//           ),
//         ),
//         onPressed: () {
//           if (eventNameController.text.isEmpty) {
//           } else {
//             if (selectedEvents[selectedDay] != null) {
//               selectedEvents[selectedDay]?.add(EventModel(
//                   title: eventNameController.text,
//                   subtitle: eventDescriptionController.text));
//             } else {
//               selectedEvents[selectedDay] = [
//                 EventModel(
//                     title: eventNameController.text,
//                     subtitle: eventDescriptionController.text)
//               ];
//             }
//           }
//           Navigator.of(context).pop();
//           eventNameController.clear();
//           setState(() {});
//           return;
//         },
//       ),
//     ],
//   );
// }

// content() {
//   var checkBoxValue = false;
//   return Container(
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(children: [
//         TextFormField(
//           autofocus: true,
//           cursorColor: Colors.white10,
//           cursorRadius: const Radius.circular(12),
//           controller: eventNameController,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 212, 209, 209),
//           ),
//           decoration: InputDecoration(
//             labelText: 'Temat',
//             labelStyle: const TextStyle(
//               color: Colors.white60,
//               fontSize: 18,
//             ),
//             border: UnderlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide.none,
//             ),
//             filled: true,
//             fillColor: Colors.white10,
//           ),
//           keyboardType: TextInputType.text,
//           maxLength: 40,
//           maxLines: 1,
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white10,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Szczegółowy opis',
//                   style: TextStyle(
//                     color: Colors.white60,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextFormField(
//                   cursorColor: Colors.white10,
//                   cursorRadius: const Radius.circular(12),
//                   controller: eventDescriptionController,
//                   style: const TextStyle(
//                     color: Colors.white,
//                   ),
//                   decoration: InputDecoration(
//                     border: UnderlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   keyboardType: TextInputType.text,
//                   maxLines: 4,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         TextFormField(
//           cursorColor: Colors.white10,
//           cursorRadius: const Radius.circular(12),
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 17,
//           ),
//           decoration: InputDecoration(
//             prefixIcon: const Icon(
//               Icons.calendar_month_outlined,
//             ),
//             prefixIconColor: Colors.white70,
//             // labelText: 'Wybrana data z kalendarza',
//             // labelStyle: const TextStyle(
//             //   color: Colors.white60,
//             //   fontWeight: FontWeight.normal,
//             // ),

//             border: UnderlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide.none,
//             ),
//             filled: true,
//             fillColor: Colors.white10,
//           ),
//         ),
//         CheckboxListTile(
//           activeColor: Colors.blue,
//           controlAffinity: ListTileControlAffinity.leading,
//           title: const Text(
//             'Dodaj godzinę',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           value: checkBoxValue,
//           onChanged: (value) {
//             setState(() {
//               checkBoxValue = value!;
//             });
//           },
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: MyInputFields(
//                 title: 'Początek',
//                 hint: '12:00',
//                 widget: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.access_time_rounded,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child: MyInputFields(
//                 title: 'Koniec',
//                 hint: '13:00',
//                 widget: IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.access_time_rounded,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ]),
//     ),
//   );
// }

