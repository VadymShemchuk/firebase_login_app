import 'package:firebase_login_app/common/auth_status.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_bloc.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_event.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_state.dart';
import 'package:firebase_login_app/utils/button_util.dart';
import 'package:firebase_login_app/utils/text_field_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 40,
              child: BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () =>
                        context.read<SignUpBloc>().add(OnSignInEvent()),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black38,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return TextFieldUtil.buildCustomTextField(
                        type: TextFieldType.name,
                        onTextFieldChanged: (name) => context
                            .read<SignUpBloc>()
                            .add(SignUpNameChanged(name)),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        return TextFieldUtil.buildCustomTextField(
                          type: TextFieldType.email,
                          errorText:
                              state.isEmailValid ? null : state.emailError,
                          onTextFieldChanged: (email) => context
                              .read<SignUpBloc>()
                              .add(SignUpEmailChanged(email)),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        return TextFieldUtil.buildCustomTextField(
                          type: TextFieldType.password,
                          errorText: state.isPasswordValid
                              ? null
                              : state.passwordError,
                          onTextFieldChanged: (password) => context
                              .read<SignUpBloc>()
                              .add(SignUpPasswordChanged(password)),
                          onSecurePressed: () => context
                              .read<SignUpBloc>()
                              .add(SignUpChangeSecure()),
                          changeSecureIcon: state.changeSecureIcon,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        return ButtonUtil.buildCommonButton(
                          context,
                          onPressed: () =>
                              context.read<SignUpBloc>().add(SignUpSibmitted()),
                          buttonText: 'Sign Up',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
