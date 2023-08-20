import 'package:flutter/material.dart';

class AddPageButtons {
  final BuildContext context;
  final String? title;
  final String? subtitle;
  final DateTime createdDate;
  final DateTime updatedDate;
  final Color selectedColor;

  AddPageButtons({required this.context,
    required this.title,
    required this.subtitle,
    required this.createdDate,
    required this.updatedDate,
    required this.selectedColor,});
}
