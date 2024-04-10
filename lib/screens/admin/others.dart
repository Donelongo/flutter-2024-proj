import 'package:flutter/material.dart';
import './notes.dart';

// Model class representing a note
class _Note {
  final String title;
  final String content;

  _Note({required this.title, required this.content});
}

class _ViewNotesPage extends StatelessWidget {
  // Sample list of notes (replace with your data)
  final List<_Note> notes = [
    _Note(
      title: 'Note 1',
      content: 'This is the content of note 1.',
    ),
    _Note(
      title: 'Note 2',
      content: 'This is the content of note 2.',
    ),
    _Note(
      title: 'Note 3',
      content: 'This is the content of note 3.',
    ),
  ];

  _ViewNotesPage();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.dark),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View Notes'),
        ),
        body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
            );
          },
        ),

      ),
    );
  }
}

class ViewOtherNotesPage extends StatelessWidget {
  const ViewOtherNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.dark),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Other's Notes"),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return OthersNotesCard(
              title: 'Note ${index + 1}',
              content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              onTap: () {
                _showNoteDetails(context, 'Note ${index + 1}');
              },
              // onEdit: () {
              //   _editNote(context, 'Note ${index + 1}');
              // },
              // onDelete: () {
              //   _deleteNote(context, 'Note ${index + 1}');
              // },
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.history),
            ),
            IconButton(
                onPressed: () {
                  //navigate to notes page
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>const Notepage()),);
                },
                icon: const Icon(Icons.notes),
              ),

            IconButton(
                onPressed: () async {
               // Navigate to 'other.dart'
                    await Navigator.push(context, MaterialPageRoute(builder: (context) =>const ViewOtherNotesPage()),);
                },
                icon: const Icon(Icons.people_alt),
              ),
          ],
        ),
      ),
      ),
    );
  }
}


class OthersNoteDetailsDialog extends StatelessWidget {
  final String noteTitle;

  const OthersNoteDetailsDialog({required this.noteTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            noteTitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
      const SizedBox(height: 16),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                //   const Text(
                //   'Lorem ipsum',
                //     style:  TextStyle(
                //       fontSize: 16,
                //     ),
                //   ),
          const SizedBox(height: 16),
                  const Text(
                  'Cillum tempor aute do esse exercitation nulla tempor. Non laborum enim tempor amet quis minim fugiat. Nulla aliqua consequat duis qui aliquip Lorem.',
                    style:  TextStyle(
                      fontSize: 16,
                    ),
                  ),
          const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Back'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




  void _showNoteDetails(BuildContext context, String noteTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return OthersNoteDetailsDialog(noteTitle: noteTitle);
      },
    );
  }

  // void _editNote(BuildContext context, String noteTitle) {
  //   // Handle edit action
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text('Edit: $noteTitle'),
  //   ));
  // }

  // void _deleteNote(BuildContext context, String noteTitle) {
  //   // Handle delete action
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text('Delete: $noteTitle'),
  //   ));
  // }


class OthersNotesCard extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onTap;
  // final VoidCallback onEdit;
  // final VoidCallback onDelete;

  const OthersNotesCard({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
    // required this.onEdit,
    // required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // Return a widget here, for example:
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(content),
        onTap: onTap,
      ),
    );
  }

void main() {
  runApp(MaterialApp(
    home: _ViewNotesPage(),
  ));
}
}