import 'package:flutter/material.dart';

class ButtonUtil {
  const ButtonUtil._();

  static Widget buildCommonButton(
    BuildContext context, {
    double horizontalOffsets = 40,
    double borderRadius = 18,
    double buttonHeight = 59,
    required void Function()? onPressed,
    required String buttonText,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  static Widget buildTextButton({
    required String buttonLabel,
    required void Function()? onPressed,
    String? prefixLabel,
    Color prefixColor = Colors.black45,
  }) {
    String prefixLabelText = prefixLabel ?? '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          style: TextStyle(
            color: prefixColor,
          ),
          prefixLabelText,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonLabel,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
