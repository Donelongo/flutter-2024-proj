import 'package:flutter/material.dart';
import './addnotes.dart';
import 'package:digital_notebook/models/note_model.dart';
import 'package:digital_notebook/widgets/note_card.dart';
import '../widgets/avatar.dart';
import './others.dart';



class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => NotepageState();
}

class NotepageState extends State<Notepage> with SingleTickerProviderStateMixin {
  List<Note> notes = List.empty(growable: true);
  late TabController _tabController;

  @override
@override
void initState() {
  super.initState();
  _tabController = TabController(length: 2, vsync: this);
  _tabController.addListener(() {
    setState(() {});
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child:  Text(
            'Notes',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: CircleAvatarWidget(key: Key('avatar')),
                ),
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NotesCard(note: notes[index], index: index, onNoteDeleted: onNoteDeleted, onNoteEdited: onNoteEdited,);
            },
          ),
            const ViewOtherNotesPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
      controller: _tabController,
      onTap: (index) {
        _tabController.animateTo(index);
      },
tabs: const [
  Tab(icon: Icon(Icons.notes), text: "Notes"),
  Tab(icon: Icon(Icons.people_alt), text: "People"),
],
      ),
    floatingActionButton: _tabController.index == 0
    ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNote(
                      onNewNoteCreated: onNewNoteCreated,
                    )),
          );
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      )
    : null,
    );
  }
  void onNewNoteCreated(Note note){
    notes.add(note);
    setState((){});
    }

  void onNoteDeleted(int index){
    notes.removeAt(index);
    setState(() {});
  }
  void onNoteEdited(int index, String newTitle, String newBody){
  notes[index].title = newTitle;
  notes[index].body = newBody;
  setState(() {});
}
}





















//       body: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return NotesCard(
//             title: 'Note ${index + 1}',
//             content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//             onTap: () {
//               _showNoteDetails(context, 'Note ${index + 1}');
//             },
//             onEdit: () {
//               _editNote(context, 'Note ${index + 1}');
//             },
//             onDelete: () {
//               _deleteNote(context, 'Note ${index + 1}');
//             },
//           );
//         },
//       ),


//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) =>const AddNote()),
//           );
//         },
//           backgroundColor: Colors.grey[700],
//           child: const Icon(Icons.add,
//           color: Colors.white,),
//       ),

//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//         iconTheme: const IconThemeData(color: Colors.white),
//     ),
//         child: BottomAppBar(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       // Handle my notes button press
//                     },
//                     icon: const Icon(Icons.notes),
//                   ),
//                   IconButton(
//         onPressed: () async {
//           // Navigate to 'other.dart'
//           await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) =>const ViewOtherNotesPage()),
//           );
//         },
//         icon: const Icon(Icons.people_alt),
//       ),
//                 ],
//               ),
//             ),
//       ),
//           );
//         }

//   void _showNoteDetails(BuildContext context, String noteTitle) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return NoteDetailsDialog(noteTitle: noteTitle);
//       },
//     );
//   }

//   void _editNote(BuildContext context, String noteTitle) {
//     // Handle edit action
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Edit: $noteTitle'),
//     ));
//   }

//   void _deleteNote(BuildContext context, String noteTitle) {
//     // Handle delete action
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Delete: $noteTitle'),
//     ));
//   }
// }

// class NotesCard extends StatelessWidget {
//   final String title;
//   final String content;
//   final VoidCallback onTap;
//   final VoidCallback onEdit;
//   final VoidCallback onDelete;

//   const NotesCard({
//     super.key,
//     required this.title,
//     required this.content,
//     required this.onTap,
//     required this.onEdit,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 2,
//         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
//         child: ListTile(
//           title: Text(
//             title,
//             style: const TextStyle(
//               fontSize: 16,
//             ),
//           ),
//           subtitle: Text(
//             content,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // IconButton(
//               //   onPressed: onEdit,
//               //   icon: const Icon(Icons.edit),
//               // ),
//               IconButton(
//                 onPressed: onDelete,
//                 icon: const Icon(Icons.delete),
//               ),
//               const Icon(Icons.arrow_forward_ios),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NoteDetailsDialog extends StatelessWidget {
//   final String noteTitle;

//   const NoteDetailsDialog({required this.noteTitle, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       elevation: 0,
//       child: contentBox(context),
//     );
//   }

//   Widget contentBox(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             noteTitle,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   TextFormField(
//                     initialValue: noteTitle,
//                     decoration: const InputDecoration(
//                       labelText: 'Title',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextFormField(
//                     initialValue: 'Note content goes here...',
//                     minLines: 10,
//                     maxLines: null,
//                     decoration: const InputDecoration(
//                       labelText: 'Note',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('Save'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// void main() {
//   runApp(const MaterialApp(
//     home: NotesPage(),
//   ));
// }