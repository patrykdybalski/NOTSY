import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'note_model.freezed.dart';

@freezed
class NoteModel with _$NoteModel {
  const NoteModel._();
  factory NoteModel(
     String title,
     String subtitle,
     DateTime createdDate,
     DateTime updatedDate,
     Color color,
     String id,
    
  ) = _NoteModel;

 
}



// class NoteModel {
//   NoteModel({
//     required this.title,
//     required this.subtitle,
//     required this.createdDate,
//     required this.updatedDate,
//     required this.color,
//     required this.id,
//     this.isFavourite = false,
//   });
//   late final String title;
//   late final String subtitle;
//   final DateTime createdDate; // Data utworzenia notatki
//   final DateTime updatedDate; // Data ostatniej aktualizacji notatki
//   final Color color;
//   final String id;
//   bool isFavourite;
// }
