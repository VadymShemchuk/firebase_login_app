import 'package:firebase_login_app/utils/button_util.dart';
import 'package:firebase_login_app/utils/text_field_util.dart';
import 'package:flutter/material.dart';

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
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black38,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldUtil.buildCustomTextField(
                    type: TextFieldType.name,
                    onTextFieldChanged: (name) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: TextFieldUtil.buildCustomTextField(
                      type: TextFieldType.email,
                      onTextFieldChanged: (email) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: TextFieldUtil.buildCustomTextField(
                      type: TextFieldType.password,
                      onTextFieldChanged: (password) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ButtonUtil.buildCommonButton(
                      context,
                      onPressed: () {},
                      buttonText: 'Sign Up',
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
