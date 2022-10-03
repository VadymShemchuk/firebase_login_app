import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_state.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_status.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_view.dart';
import 'package:firebase_login_app/source/sign_up/sign_up_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInModule extends StatelessWidget {
  const SignInModule({Key? key}) : super(key: key);

  static const route = '/signIn';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignInBloc(authRepository: context.read<AuthRepository>()),
      child: BlocConsumer<SignInBloc, SignInState>(
        builder: (_, state) => const SignInView(),
        listenWhen: (previous, current) =>
            previous.status is! FailureAuthStatus ||
            current.status is ChangeOnSignUpStatus,
        listener: (_, state) {
          if (state.status is SuccessAuthStatus) {
            Navigator.of(context).pushReplacementNamed(SignInModule.route);
          } else if (state.status is FailureAuthStatus) {
            String? error = (state.status as FailureAuthStatus).error;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  SnackBar(content: Text(error ?? 'Authorization is failed')));
          } else if (state.status is ChangeOnSignUpStatus) {
            Navigator.of(context).pushReplacementNamed(SignUpModule.route);
          }
        },
      ),
    );
  }
}
