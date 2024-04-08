import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Note',
            style: TextStyle(
                fontSize: 20,
        ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                style: const TextStyle(fontSize: 28),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                ),
                maxLines: null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: bodyController,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your note here...",
                ),
                maxLines: null,
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
    );
  }
}