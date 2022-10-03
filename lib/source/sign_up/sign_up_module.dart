import 'package:firebase_login_app/common/repository/auth_repository.dart';
import 'package:firebase_login_app/source/profile/profile_module.dart';
import 'package:firebase_login_app/common/navigator_status.dart';
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
      create: (_) => SignUpBloc(
        authRepository: context.read<AuthRepository>(),
      ),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: (previous, current) => previous.status is! FailureAuth,
        listener: (_, state) {
          if (state.status is SuccessAuth) {
            Navigator.of(context).pushReplacementNamed(ProfileModule.route);
          } else if (state.status is FailureAuth) {
            String? error = (state.status as FailureAuth).error;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                  SnackBar(content: Text(error ?? 'Authorization is failed')));
          } else if (state.status is OnSignIn) {
            Navigator.of(context).pop();
          }
        },
        builder: (_, state) => SignUpView(state),
      ),
    );
  }
}
