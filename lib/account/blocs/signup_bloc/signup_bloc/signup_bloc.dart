// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<RequestPageLoad>(_requestSignupPage);
    on<OnSignupSubmit>(_handleSubmit);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    // passwordController.dispose();
    return super.close();
  }

  void _requestSignupPage(RequestPageLoad event, Emitter<SignupState> emit) {
    emit(SignupLoading());
    emit(SignupDefault(
      email: emailController,
      password: passwordController,
      error: SignupError.none,
    ));
  }

  Future<void> _handleSubmit(OnSignupSubmit event, Emitter<SignupState> emit) async {
    emit(SignupLoading());

    // call the api here
    await Future.delayed(const Duration(seconds: 2));

    bool successfullyRegisteredUser = await _fakeSignupApiCall();

    if (successfullyRegisteredUser) {
      emit(SignupSuccess());
    } else {
      emit(
        SignupDefault(
          email: emailController,
          password: passwordController,
          error: SignupError.input,
        ),
      );
    }
  }

  Future<bool> _fakeSignupApiCall() async {
    // Simulate API call here
    return Future.delayed(const Duration(seconds: 1), () => true); // Change to actual API call
  }
}
