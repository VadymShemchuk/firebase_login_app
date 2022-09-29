import 'package:firebase_login_app/utils/color_util.dart';
import 'package:flutter/material.dart';

class TextFieldUtil {
  const TextFieldUtil._();

  static Widget buildTextField({
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
