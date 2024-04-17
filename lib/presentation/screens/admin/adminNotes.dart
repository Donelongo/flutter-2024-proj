// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../addnotes.dart';
import 'package:digital_notebook/models/note_model.dart';
import 'package:digital_notebook/presentation/widgets/note_card.dart';


class AdminNotepage extends StatefulWidget {
  const AdminNotepage({super.key});

  @override
  State<AdminNotepage> createState() => AdminNotepageState();
}

class AdminNotepageState extends State<AdminNotepage> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NotesCard(
            note: notes[index],
            index: index,
            onNoteDeleted: onNoteDeleted,
            onNoteEdited: onNoteEdited,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddNoteDialog(context);
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showAddNoteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddNote(
          onNewNoteCreated: onNewNoteCreated,
        );
      },
    );
  }

  void onNewNoteCreated(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void onNoteDeleted(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void onNoteEdited(int index, String newTitle, String newBody) {
    setState(() {
      notes[index].title = newTitle;
      notes[index].body = newBody;
    });
  }
}
