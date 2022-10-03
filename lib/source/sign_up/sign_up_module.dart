import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_status.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_bloc.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_state.dart';
import 'package:firebase_login_app/source/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpModule extends StatelessWidget {
  const SignUpModule({super.key});

  static const route = '/SignUp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpBloc(authRepository: context.read<AuthRepository>()),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: (previous, current) =>
            previous.status is! FailureAuthStatus,
        listener: (_, state) {
          if (state.status is SuccessAuthStatus) {
            //TODO on profile
          } else if (state.status is FailureAuthStatus) {
            String? error = (state.status as FailureAuthStatus).error;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  SnackBar(content: Text(error ?? 'Authorization is failed')));
          }
        },
        builder: (context, state) => SignUpView(),
      ),
    );
  }
}
