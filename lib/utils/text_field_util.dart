import 'package:firebase_login_app/utils/color_util.dart';
import 'package:flutter/material.dart';

enum TextFieldType { email, password, name }

class TextFieldUtil {
  const TextFieldUtil._();

  static Widget buildCustomTextField({
    required TextFieldType type,
    String? errorText,
    bool? changeSecureIcon,
    required void Function(String)? onTextFieldChanged,
    void Function()? onSecurePressed,
  }) {
    Widget widget;
    switch (type) {
      case TextFieldType.email:
        widget = _buildCommonTextField(
          hintText: 'Enter email',
          icon: Icons.alternate_email_rounded,
          onTextFieldChanged: onTextFieldChanged,
          errorText: errorText,
        );
        break;
      case TextFieldType.password:
        widget = _buildCommonTextField(
          hintText: 'Enter password',
          icon: Icons.password_rounded,
          onTextFieldChanged: onTextFieldChanged,
          errorText: errorText,
          isSecure: true,
          onSecurePressed: onSecurePressed,
          changeSecureIcon: changeSecureIcon,
        );
        break;
      case TextFieldType.name:
        widget = _buildCommonTextField(
            hintText: 'Enter Name',
            icon: Icons.account_circle_outlined,
            onTextFieldChanged: onTextFieldChanged);
        break;
    }
    return widget;
  }

  static Widget buildStaticText(
      {required String text,
      double fontSize = 18,
      FontWeight fontWeight = FontWeight.w200}) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static Widget _buildCommonTextField({
    required String hintText,
    String? errorText,
    required IconData icon,
    bool isSecure = false,
    bool? changeSecureIcon,
    required void Function(String)? onTextFieldChanged,
    void Function()? onSecurePressed,
  }) {
    MaterialColor colorCustom =
        ColorUtil.createMaterialColor(const Color(0xFFFFFFFF));
    Icon secureIcon = changeSecureIcon ?? true
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);
    bool obscureText = changeSecureIcon ?? false;
    return Theme(
      data: ThemeData(primarySwatch: colorCustom),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: obscureText,
        onChanged: onTextFieldChanged,
        decoration: InputDecoration(
          suffixIcon: isSecure
              ? IconButton(
                  icon: secureIcon,
                  onPressed: onSecurePressed,
                )
              : null,
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorText: errorText,
        ),
      ),
    );
  }
}
