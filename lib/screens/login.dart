import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, '/');
        return false; // Prevents the default behavior
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/admin');
              },
            child: const Text('Admin'),
          ),
          )
        ],

        ),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.grey,
                      child: ClipOval(
                        child: Image.asset(
                        './assets/images/echologo.png',
                        fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text('Welcome back!',
                      style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text('Enter your Credentials to login',
                    textAlign: TextAlign.center,),
                    const SizedBox(height: 20),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.mail_outlined,
                        color: Colors.grey,),
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/notes');
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: "Don't have an acconunt? "),
                          TextSpan(
                              text: 'SignUp',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/signup');
                                }
                            )
                        ]
                        ),
                    ),
                    ],
                ),

              ),
            ),
          ),
        );
  }
}
