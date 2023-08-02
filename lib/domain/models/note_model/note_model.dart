class NoteModel {
  NoteModel ({
    required this.title,
    required this.subtitle,
     required this.id,
    required this.createdDate,
    required this.updatedDate,
    
   

  });
  final String title;
  final String subtitle;
  final String id;
  final DateTime createdDate; // Data utworzenia notatki
  final DateTime updatedDate; // Data ostatniej aktualizacji notatki
  
}