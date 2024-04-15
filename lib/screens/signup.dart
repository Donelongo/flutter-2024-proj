import 'package:flutter/gestures.dart';
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
                style: TextStyle(
                  fontSize: 15,
                ),
                  textAlign: TextAlign.center),
                const SizedBox(height: 30),
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
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20),
                RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: "Already have an account? "),
                          TextSpan(
                              text: 'Login',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/');
                                }
                            )
                        ]
                        ),
                    ),
              ],
            ),
          ),
        ),
    );
  }
}