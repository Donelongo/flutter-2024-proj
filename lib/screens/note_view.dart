import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NoteView extends StatefulWidget {
  const NoteView({super.key, required this.note, required this.index, required this.onNoteDeleted, required this.onNoteEdited});

  final Note note;
  final int index;

  final Function(int) onNoteDeleted;
  final Function(int, String, String) onNoteEdited;

  @override
  NoteViewState createState() => NoteViewState();
}

class NoteViewState extends State<NoteView> {
  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    bodyController = TextEditingController(text: widget.note.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context){
                  return Theme(
                    data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
                    child: AlertDialog(
                      title: const Text("Edit Note",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      content: Column(
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(hintText: 'Title'),
                            style: const TextStyle(
                              fontSize: 25
                            ),
                          ),
                          TextField(
                            controller: bodyController,
                            decoration: const InputDecoration(hintText: 'Body'),
                            maxLines: null,
                          ),
                        ],
                      ),
                      actions:[
                        TextButton(
                          onPressed: (){
                            widget.onNoteEdited(widget.index, titleController.text, bodyController.text);
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text("Save"),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        )
                      ]
                    ),
                  );
                }
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context){
                  return Theme(
                    data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
                    child: AlertDialog(
                      title: const Text("Delete Note ?",
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                      content: Text("Note '${widget.note.title}' will be deleted!"),
                      actions:[
                        TextButton(
                          onPressed: (){
                            widget.onNoteDeleted(widget.index);
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text("Delete"),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        )
                      ]
                    ),
                  );
                }
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.title,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10,),
            Text(
              widget.note.body,
              style: const TextStyle(fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}