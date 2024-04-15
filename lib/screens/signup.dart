import 'package:flutter/material.dart';
import '../widgets/password.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20),
                const Text('Create an account to get started',
                  textAlign: TextAlign.center),
                const SizedBox(height: 100),
                const Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Icon(Icons.mail_outlined, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const PasswordWidget(
                  label: 'Password',
                ),
                const SizedBox(height: 20),
                const PasswordWidget(
                  label: 'Confirm Password',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
    );
  }
}