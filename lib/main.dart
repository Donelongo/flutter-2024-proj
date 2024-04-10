
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
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),

        ),

        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          bodyText1: TextStyle(color: Colors.white),
          // ignore: deprecated_member_use
          bodyText2: TextStyle(color: Colors.white),

        ),

        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.white,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/admin': (context) =>  const AdminPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/notes': (context) => const Notepage(),
      },
    );
  }
}
