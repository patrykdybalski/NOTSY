import 'package:flutter/material.dart';

class NoteModel {
  NoteModel({
    required this.title,
    required this.subtitle,
    required this.createdDate,
    required this.updatedDate,
    required this.color,
    required this.id,
  });
  late final String title;
  late final String subtitle;
  final DateTime createdDate; // Data utworzenia notatki
  final DateTime updatedDate; // Data ostatniej aktualizacji notatki
  final Color color;
  final String id;
}
