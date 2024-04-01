// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:digital_notebook/screens/home.dart';
import 'package:digital_notebook/screens/admin/admin.dart';
import 'package:digital_notebook/screens/login.dart';
import 'package:digital_notebook/screens/signup.dart';
import 'package:digital_notebook/screens/notes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/admin': (context) => AdminPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/notes': (context) => NotesPage(),
      },
    );
  }
}
