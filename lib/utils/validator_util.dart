class ValidatorUtil {
  const ValidatorUtil._();

  static String? emailError(String value) {
    String? errorText;
    if (value.isEmpty) {
      errorText = 'Email is empty!';
    } else if (value.isNotEmpty && !value.isValidEmail) {
      errorText = 'Email must be an email adress';
    }
    return errorText;
  }

  static String passwordError(String value) {
    String errorText = 'Error';
    if (value.isEmpty) {
      errorText = 'Password is empty!';
    } else if (value.isNotEmpty && value.length < 6) {
      errorText = 'Password must have at least 6 characters';
    }
    return errorText;
  }

  static bool isEmailValid(String value) {
    if (value.isEmpty || !value.isValidEmail) {
      return false;
    } else {
      return true;
    }
  }

  static bool isPasswordValid(String value) {
    if (value.isEmpty || value.length < 6) {
      return false;
    } else {
      return true;
    }
  }
}

extension Valid on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }
}
