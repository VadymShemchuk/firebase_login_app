import 'package:firebase_login_app/source/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_event.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_state.dart';
import 'package:firebase_login_app/common/navigator_status.dart';
import 'package:firebase_login_app/utils/button_util.dart';
import 'package:firebase_login_app/utils/text_field_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView(this.state, {Key? key}) : super(key: key);

  final SignInState state;

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldUtil.buildCustomTextField(
                type: TextFieldType.email,
                errorText: state.isEmailValid ? null : state.emailError,
                onTextFieldChanged: (email) =>
                    context.read<SignInBloc>().add(SignInEmailChanged(email))),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextFieldUtil.buildCustomTextField(
                type: TextFieldType.password,
                errorText: state.isPasswordValid ? null : state.passwordError,
                onTextFieldChanged: (password) => context
                    .read<SignInBloc>()
                    .add(SignInPasswordChanged(password)),
                changeSecureIcon: state.changeSecureIcon,
                onSecurePressed: () =>
                    context.read<SignInBloc>().add(SignInChangeSecure()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: state.status is ProgressAuth
                  ? const SizedBox(
                      height: 59,
                      width: 59,
                      child: CircularProgressIndicator(),
                    )
                  : ButtonUtil.buildCommonButton(
                      context,
                      onPressed: () =>
                          context.read<SignInBloc>().add(SignInSubmitted()),
                      buttonText: 'Sign In',
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ButtonUtil.buildTextButton(
                onPressed: () =>
                    context.read<SignInBloc>().add(OnSignUpEvent()),
                prefixLabel: 'No account?',
                buttonLabel: 'Sign Up',
              ),
            )
          ],
        ),
      ),
    );
  }
}
