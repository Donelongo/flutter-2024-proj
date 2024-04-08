import 'package:flutter/material.dart';
import 'package:digital_notebook/screens/admin/admin.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text('Home'),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/e.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Admin Button
              Positioned(
                top: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AdminPage()),
                    );
                  },
                  child: const Text('Admin'),
                ),
              ),
              // Buttons
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 20),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, '/notes');
                    //   },
                    //   child: const Text('View Notes'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

class AdminLogsPage extends StatelessWidget {
  const AdminLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Logs'),
      ),
      body: const Center(
        child: Text('Admin Logs will be displayed here'),
      ),
    );
  }
}
