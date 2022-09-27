import 'dart:math';

import 'package:firebase_login_app/source/sign_in/sign_in_status.dart';

abstract class InitialSignInState {}

class SignInState extends InitialSignInState {
  final String email;
  final String password;
  final String? error;
  bool keepSignIn;
  SignInStatus status;

  SignInState({
    this.email = '',
    this.password = '',
    this.error,
    this.keepSignIn = false,
    this.status = const InitialSignInStatus(),
  });

  SignInState copyWith({
    String? email,
    String? password,
    String? error,
    bool? keepSignIn,
    SignInStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      error: error ?? this.error,
      keepSignIn: keepSignIn ?? this.keepSignIn,
      status: status ?? this.status,
    );
  }
}

class SuccsessSingInState extends InitialSignInState {}

class FailureSignInState extends InitialSignInState {}
