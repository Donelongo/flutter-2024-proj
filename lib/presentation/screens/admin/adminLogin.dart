// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../widgets/password.dart';
import '../../widgets/email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digital_notebook/account/blocs/signup_bloc/authentication_bloc.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
      final bloc = context.read<AuthenticationBloc>();
      // Doing this so that it wont remember the state it was in when someone logs out or something
      bloc.add(RequestPageLoad());

      return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state){
            if (state is AuthenticationSuccess) {
                // go to where you want
                Navigator.pushNamed(context, '/admin');
            }
        },

        builder: (context, state) {

        if (state is AuthenticationInitial){
        return const Scaffold(
                body: Center(child: CupertinoActivityIndicator())
                );
        }
        else if(state is AuthenticationDefault){
        return Scaffold(
                appBar: AppBar(
                    title: const Text('Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                            ),
                        ),
                    ),
                body: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [const Center(
                                    child: Text(
                                        'Welcome Back, Admin',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            ),
                                        ),
                                    ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    const Text(
                                        'Not an Admin,',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            ),
                                        ),
                                    TextButton(
                                        onPressed: () {
                                        Navigator.pushNamed(context, '/signup');
                                        },
                                    child: const Text(
                                              'Click here',
                                              style: TextStyle(
                                                  color: Colors.blueGrey,
                                                  fontSize: 13,
                                                  ),
                                              ),
                                            ),
                                        ],
                                    ),
                                    EmailField(email: state.email),
                                    const SizedBox(height: 20),
                                    const PasswordWidget(
                                            ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                            onPressed: () {
                                                bloc.add(OnSubmitEvent());
                                            },
                                    child: const Text('Login', style:TextStyle(color: Colors.blueGrey)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }else{
                        return const Scaffold(
                          body: Center(child: CupertinoActivityIndicator())
                        );
                    }
                  },
                );
              }
  }
