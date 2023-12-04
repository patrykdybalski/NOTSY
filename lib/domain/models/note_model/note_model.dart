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



