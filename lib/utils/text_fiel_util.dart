import 'package:flutter/material.dart';

enum TextFieldType { email, password, name }

class TextFieldUtil {
  const TextFieldUtil._();

  static Widget buildTextField() {
    return TextFormField();
  }

  static Widget _buildTextField(
    TextInputAction action,
    String hintText,
    IconData icon,
    bool obscureText,
    void Function(String)? onTextFieldChanged,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      cursorColor: Colors.grey,
      style: const TextStyle(
        color: Colors.black,
      ),
      textInputAction: action,
      obscureText: obscureText,
      onChanged: onTextFieldChanged,
      validator: validator,
      decoration: InputDecoration(hintText: hintText, icon: Icon(icon)),
    );
  }
}
