import 'package:firebase_login_app/source/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_event.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_state.dart';
import 'package:firebase_login_app/utils/button_util.dart';
import 'package:firebase_login_app/utils/text_field_util.dart';
import 'package:firebase_login_app/utils/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    return Scaffold(backgroundColor: Colors.blueGrey, body: newMethod(context));
  }

  Widget newMethod(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return TextFieldUtil.buildTextField(
                  errorText: state.isEmailValid ? null : state.emailError,
                  hintText: 'Enter email',
                  icon: Icons.alternate_email_rounded,
                  onTextFieldChanged: (email) =>
                      context.read<SignInBloc>().add(ChangeEmailEvent(email)));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return TextFieldUtil.buildTextField(
                  errorText: state.isPasswordValid ? null : state.passwordError,
                  hintText: 'Enter password',
                  icon: Icons.password_rounded,
                  isSecure: true,
                  onTextFieldChanged: (password) => context
                      .read<SignInBloc>()
                      .add(ChangePasswordEvent(password)),
                  changeSecureIcon: state.changeSecureIcon,
                  onSecurePressed: () =>
                      context.read<SignInBloc>().add(ChangeSecureEvent()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return state is ProgressSignInState
                    ? const SizedBox(
                        height: 40,
                        child: CircularProgressIndicator(),
                      )
                    : ButtonUtil.buildButton(
                        context,
                        onPressed: () =>
                            context.read<SignInBloc>().add(SubmitSignInEvent()),
                        buttonText: 'Sign In',
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
