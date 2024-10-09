import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubit/add_note_cuibt/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/cutom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddNoteFormState();
}

@override
State<AddNoteForm> createState() => _AddNoteFormState();

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
                onSaved: (value) {
                  title = value;
                },
                hint: 'title'),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'content',
              maxLines: 5,
            ),


            const SizedBox(
              height: 32,
            ),
          ColorsListView(),
            
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                    isloading: state is AddNoteLoding ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        var currentDate = DateTime.now();
                        var formattedCurrentDate =
                            DateFormat.yMd().format(currentDate);

                        var noteModel = NoteModel(
                            title: title!,
                            subTitle: subTitle!,
                            date: formattedCurrentDate,
                            color: Colors.blue.value);
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    });
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
