import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_state.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_status.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_view.dart';
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
        builder: (__, _) => const SignInView(),
        listenWhen: (previous, current) =>
            previous.status is ProgressSignInStatus,
        listener: (_, state) {
          if (state.status is SuccessSignInStatus) {
            Navigator.of(context).pushReplacementNamed(SignInModule.route);
          } else if (state.status is FailureSignInStatus) {
            String? error = (state.status as FailureSignInStatus).error;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  SnackBar(content: Text(error ?? 'Authorization is failed')));
          }
        },
      ),
    );
  }
}
