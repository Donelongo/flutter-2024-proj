
import 'package:flutter/material.dart';
import 'package:digital_notebook/screens/home.dart';
import 'package:digital_notebook/screens/admin/admin.dart';
import 'package:digital_notebook/screens/login.dart';
import 'package:digital_notebook/screens/signup.dart';
import 'package:digital_notebook/screens/notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black45,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/admin': (context) => const AdminPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/notes': (context) => const NotesPage(),
      },
    );
  }
}
