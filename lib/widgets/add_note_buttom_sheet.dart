import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubit/add_note_cuibt/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              print('failied   ${state.errMessage}');
            }
            if (state is AddNoteFailure) {
              Navigator.pop(context);
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoding ? true : false,
              child: const SingleChildScrollView(child: AddNoteForm()),
              // Column(
              //   children: [
              //     SizedBox(
              //       height: 32,
              //     ),
              //     CustomTextField(
              //       hint: 'Title',
              //     ),
              //     SizedBox(
              //       height: 16,
              //     ),
              //     CustomTextField(
              //       hint: 'Content',
              //       maxLines: 5,
              //     ),
              //     SizedBox(
              //       height: 32,
              //     ),
              //     CustomButton(),
              //   ],
              // ),
            );
          },
        ),
      ),
    );
  }
}
