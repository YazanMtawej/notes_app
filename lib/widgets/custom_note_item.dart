import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubit/add_note_cuibt/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes});
final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return  EditNotesView(
            notes: notes,
          );
        }));
      },
      child: Container(
       
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16,),
        decoration: BoxDecoration(
          color: Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                notes.title,
                style: const TextStyle(fontSize: 26, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(notes.subTitle,
                    style: TextStyle(
                        fontSize: 18, color: Colors.black.withOpacity(.5))),
              ),
              trailing: IconButton(
                  onPressed: () {
                    notes.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAlNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                notes.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                  fontSize: 16,
                ),
              ),
             ),
         ], 
        ),
      ),
    );
  }
}