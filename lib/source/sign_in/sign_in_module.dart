import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInModule extends StatelessWidget {
  const SignInModule({super.key});

  static const route = '/signIn';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignInBloc(authRepository: context.read<AuthRepository>()),
      child: const SignInView(),
    );
  }
}
