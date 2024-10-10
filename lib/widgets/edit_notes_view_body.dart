import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_note_cuibt/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/cutom_text_field.dart';
import 'package:notes_app/widgets/edit_note_colors_listview.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.notes});

  final NoteModel notes;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.notes.title = title ?? widget.notes.title;
              widget.notes.subTitle = content ?? widget.notes.subTitle;
              widget.notes.save();
              BlocProvider.of<NotesCubit>(context).fetchAlNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.notes.title),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.notes.subTitle,
            maxLines: 5,
          ),
           const SizedBox(
            height: 32,
          ),
           EditNoteColorsList(
            notes: widget.notes,
           ),
        ],
      ),
    );
  }
}
