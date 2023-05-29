import 'package:flutter/material.dart';

class MyInputFields extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget widget;

  const MyInputFields(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}
