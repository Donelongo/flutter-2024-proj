import 'package:flutter/material.dart';
import 'add_activity_dialog.dart';
import './others.dart';
import './notes.dart';

void main() {
  runApp(AdminPage());
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Logs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AdminHomePage(),
    );
  }
}

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() =>
      _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  List<Activity> activities = [];

  TextEditingController _activityController = TextEditingController();
  TextEditingController _userController = TextEditingController();

  DateTime? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                title: Text(activities[index].name),
                subtitle: Text(
                    'User: ${activities[index].user}, Date: ${activities[index].date}, Time: ${activities[index].time}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditActivityDialog(context, index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteActivity(index);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              if (activities[index].logs.isNotEmpty) ...[
                Text(
                  'Logs:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Column(
                  children: activities[index]
                      .logs
                      .map((log) => Text(
                            log,
                            textAlign: TextAlign.center,
                          ))
                      .toList(),
                ),
                SizedBox(height: 8),
              ],
              Divider(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddActivityDialog(context);
        },
        child: Icon(Icons.add),
      ),
     bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                // Handle my notes button press
              },
              icon: const Icon(Icons.history),
            ),
            IconButton(
                onPressed: () {
                  
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>const NotesPage()),);
                },
                icon: const Icon(Icons.notes),
              ),
             
            IconButton(
  onPressed: () async {
    // Navigate to 'other.dart'
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>const ViewOtherNotesPage()),
    );
  },
  icon: const Icon(Icons.people_alt),
),
          ],
        ),
      ),  
    );
  }

  void _showAddActivityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddActivityDialog(
          userController: _userController,
          activityController: _activityController,
          selectedDateTime: _selectedDateTime,
          onAddActivity: (user, activity, dateTime) {
            _addActivity(user, activity, dateTime);
          },
          onCloseDialog: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _addActivity(String user, String activityName, DateTime dateTime) {
    setState(() {
      activities.add(Activity(
        user: user,
        name: activityName,
        date: '${dateTime.year}-${dateTime.month}-${dateTime.day}',
        time: '${dateTime.hour}:${dateTime.minute}',
        logs: ['Added at ${DateTime.now()}'], // Log entry for adding the activity
      ));
    });
  }

  void _showEditActivityDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Activity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: activities[index].user),
                decoration: InputDecoration(labelText: 'User'),
              ),
              TextField(
                controller: TextEditingController(text: activities[index].name),
                decoration: InputDecoration(labelText: 'Activity'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _editActivity(index, _userController.text, _activityController.text);
              },
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _editActivity(int index, String newUser, String newName) {
    setState(() {
      var editedActivity = activities[index];
      editedActivity.user = newUser;
      editedActivity.name = newName;
      editedActivity.logs.add('Edited at ${DateTime.now()}'); // Log entry for editing the activity
    });
  }

  void _deleteActivity(int index) {
    setState(() {
      var deletedActivity = activities[index];
      deletedActivity.logs.add('Deleted at ${DateTime.now()}'); // Log entry for deleting the activity
      activities.removeAt(index);
    });
  }
}

class Activity {
  String user;
  String name;
  String date;
  String time;
  List<String> logs;

  Activity({required this.user, required this.name, required this.date, required this.time, this.logs = const []});
}
