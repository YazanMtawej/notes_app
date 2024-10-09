import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/edit_notes_view_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.notes});

final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: EditNotesViewBody(
        notes: notes,
      ),
    );
  }
}