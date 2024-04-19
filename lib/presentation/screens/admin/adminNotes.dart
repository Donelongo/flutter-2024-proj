// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:digital_notebook/models/note_model.dart';

class AdminNotepage extends StatefulWidget {
  const AdminNotepage({super.key, required this.onNewNoteCreated, required this.currentIndex});

  final Function(Note) onNewNoteCreated;
  final int currentIndex;

  @override
  State<AdminNotepage> createState() => AdminNotepageState();
}

class AdminNotepageState extends State<AdminNotepage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Note',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
<<<<<<< HEAD
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
              maxLines: null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(fontSize: 18, color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your note here...",
              ),
              maxLines: null,
            ),
          ElevatedButton(
=======
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Note title'),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(hintText: 'Note body'),
            ),
            ElevatedButton(
>>>>>>> 5220c1bf28a8d840d5b1ed86e4d141957539a0a3
              onPressed: () {
                final note = Note(
                  title: titleController.text,
                  body: bodyController.text,
                  index: widget.currentIndex,
                );
                widget.onNewNoteCreated(note);
                Navigator.pop(context);
              },
              child: const Text('Save Note'),
            ),
<<<<<<< HEAD
          ]
=======
          ],
>>>>>>> 5220c1bf28a8d840d5b1ed86e4d141957539a0a3
        ),
      ),
    );
  }
}