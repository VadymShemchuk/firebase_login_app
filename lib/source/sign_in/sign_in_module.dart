import 'package:firebase_login_app/common/repository/auth_repository.dart';
import 'package:firebase_login_app/source/profile/profile_module.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_state.dart';
import 'package:firebase_login_app/common/navigator_status.dart';
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
        builder: (context, state) => SignInView(
          context,
          state,
        ),
        listenWhen: (previous, current) =>
            previous.status is! FailureAuth || current.status is OnSignUp,
        listener: (_, state) {
          if (state.status is SuccessAuth) {
            Navigator.of(context).pushNamed(ProfileModule.route);
          } else if (state.status is FailureAuth) {
            String? error = (state.status as FailureAuth).error;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  SnackBar(content: Text(error ?? 'Authorization is failed')));
          } else if (state.status is OnSignUp) {
            Navigator.of(context).pushNamed(SignUpModule.route);
          }
        },
      ),
    );
  }
}
