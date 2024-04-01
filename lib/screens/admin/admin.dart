import 'package:flutter/material.dart';

// Model class representing activity log data
class ActivityLog {
  final String id;
  final String message;

  ActivityLog({required this.id, required this.message});
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final List<ActivityLog> _activityLogs = [
    ActivityLog(id: '1', message: 'User logged in.'),
    ActivityLog(id: '2', message: 'User created a new note.'),
    ActivityLog(id: '3', message: 'User deleted a note.'),
  ];

  // Method to add a new activity log
  void _addActivityLog(String message) {
    setState(() {
      _activityLogs.add(ActivityLog(id: DateTime.now().toString(), message: message));
    });
  }

  // Method to edit an existing activity log
  void _editActivityLog(String id, String newMessage) {
    setState(() {
      final index = _activityLogs.indexWhere((log) => log.id == id);
      if (index != -1) {
        _activityLogs[index] = ActivityLog(id: id, message: newMessage);
      }
    });
  }

  // Method to delete an activity log
  void _deleteActivityLog(String id) {
    setState(() {
      _activityLogs.removeWhere((log) => log.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: ListView.builder(
        itemCount: _activityLogs.length,
        itemBuilder: (context, index) {
          final log = _activityLogs[index];
          return ListTile(
            title: Text(log.message),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showEditDialog(log); // Show edit dialog
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteActivityLog(log.id); // Delete log
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(); // Show add dialog
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Handle logs button press (stay on this page)
              },
              icon: const Icon(Icons.list),
            ),
            IconButton(
              onPressed: () {
                // Handle navigation to another page (for example, "Home")
                Navigator.pop(context); // Close this page
              },
              icon: const Icon(Icons.home),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show a dialog for adding a new log
  void _showAddDialog() {
    TextEditingController textFieldController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Log'),
          content: TextField(
            controller: textFieldController,
            decoration: const InputDecoration(hintText: "Enter log message"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                String message = textFieldController.text;
                if (message.isNotEmpty) {
                  _addActivityLog(message); // Add log
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // Method to show a dialog for editing an existing log
  void _showEditDialog(ActivityLog log) {
    TextEditingController textFieldController = TextEditingController(text: log.message);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Log'),
          content: TextField(
            controller: textFieldController,
            decoration: const InputDecoration(hintText: "Enter new log message"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                String message = textFieldController.text;
                if (message.isNotEmpty) {
                  _editActivityLog(log.id, message); // Edit log
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AdminPage(),
  ));
}
