// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(): super(AuthenticationInitial()){
    on<LoginSubmit>(_handleAuthentication);
  }

    _handleAuthentication(event, emit){
        if (state is AuthenticationDefault){
            final authState = state as AuthenticationDefault;
            // Have a dummy login info
            const String dummyEmail = "a@a.com";
            const String dummyPassword = "12345678";

            final actualEmail = authState.email;
            final actualPassword = authState.password.text;

          // ignore: unrelated_type_equality_checks
          if (actualEmail == dummyEmail && actualPassword == dummyPassword) { emit(AuthenticationSuccess()); }
          else{ emit(AuthenticationDefault(email: TextEditingController(), password: TextEditingController(), error: AuthenticationError.Input));}
      }
    }
}