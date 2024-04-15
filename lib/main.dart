import 'package:flutter/material.dart';
import 'package:digital_notebook/screens/home.dart';
import 'package:digital_notebook/screens/admin/admin.dart';
import 'package:digital_notebook/screens/admin/adminLogin.dart';
import 'package:digital_notebook/screens/admin/adminNotes.dart';
import 'package:digital_notebook/screens/admin/adminOthers.dart';
import 'package:digital_notebook/screens/login.dart';
import 'package:digital_notebook/screens/signup.dart';
import 'package:digital_notebook/screens/notes.dart';
import 'package:digital_notebook/screens/others.dart';

enum ThemeModeOption {
  White,
  Sepia,
  Dark,
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeModeOption _currentThemeMode = ThemeModeOption.White;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = _buildThemeData();
     // Build theme data dynamically
    return MaterialApp(
      themeMode: _currentThemeMode == ThemeModeOption.Dark
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: themeData,
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/admin': (context) => AdminPage(),
        'other': (context)=> const ViewOtherNotesPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/notes': (context) => const Notepage(),
        '/adminLogin':(context) => const AdminLoginPage(),
        '/adminNotes': (context)=> const AdminNotepage(),
        '/adminOthers':(context)=> const AdminOthersPage(),
      },
    );
  }

  ThemeData _buildThemeData() {
    switch (_currentThemeMode) {
      case ThemeModeOption.White:
        return ThemeData.light().copyWith(
          textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(fontFamily: 'Mate'),
        bodyText2: TextStyle(fontFamily: 'Mate'),
          ),   
        );
      case ThemeModeOption.Sepia:
        return ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(255, 189, 148, 128), // Sepia color
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 189, 148, 128), // Sepia color
            titleTextStyle: TextStyle(color: Colors.grey, fontFamily: 'Mate'),
            iconTheme: IconThemeData(color: Colors.grey),
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.grey, fontFamily: 'Mate'),
            bodyText2: TextStyle(color: Colors.grey, fontFamily: 'Mate'),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.white, fontFamily: 'Mate'),
            hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Mate'),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor:Color.fromARGB(255, 189, 148, 128), // Sepia color
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.grey,
          ),
          bottomAppBarTheme: BottomAppBarTheme(color:Color.fromARGB(255, 189, 148, 128)), // Sepia color
        );
      case ThemeModeOption.Dark:
        return ThemeData.dark().copyWith(
           textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(fontFamily: 'Mate'),
        bodyText2: TextStyle(fontFamily: 'Mate'),
          ),
        );
    }
  }

  void _changeThemeMode(ThemeModeOption newThemeMode) {
    setState(() {
      _currentThemeMode = newThemeMode;
    });
  }
}
