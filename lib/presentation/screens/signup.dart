// ignore_for_file: library_prefixes

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/password.dart';
import '../widgets/email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:digital_notebook/account/blocs/signup_bloc/signup_bloc/signup_bloc.dart' ;
import 'package:digital_notebook/account/blocs/signup_bloc/authentication_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          // Handle state changes
        },
      builder: (context, state) {
        if (state is AuthenticationInitial || state is PageLoading) {
          return const Scaffold(
            body: Center(child: CupertinoActivityIndicator()),
          );
        } else if (state is AuthenticationDefault) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          'Welcome, New User',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign in Here',
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      EmailField(email: state.email),
                      const SizedBox(height: 10),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'San Serif',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      PasswordWidget(passwordController: state.password),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          bloc.add(AccountCreation());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'San Serif',
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      if (state.error == AuthenticationError.InvalidCredentials)
                        const Text(
                          'Invalid email or password',
                          style: TextStyle(color: Colors.red),
                        ),
                      if (state.error == AuthenticationError.InvalidEmailFormat)
                        const Text(
                          'Invalid email format',
                          style: TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: CupertinoActivityIndicator()),
          );
        }
      },
    ));
  }
}
