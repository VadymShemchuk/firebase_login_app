class SignInState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  bool changeSecureIcon;
  bool isEmailValid;
  bool isPasswordValid;

  SignInState({
    this.emailError,
    this.passwordError,
    this.email = '',
    this.password = '',
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.changeSecureIcon = true,
  });

  SignInState copyWith({
    String? emailError,
    String? passwordError,
    String? email,
    String? password,
    bool? changeSecureIcon,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return SignInState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      changeSecureIcon: changeSecureIcon ?? this.changeSecureIcon,
    );
  }
}

class SuccsessSingInState extends SignInState {}

class FailureSignInState extends SignInState {
  final String? error;

  FailureSignInState({this.error});
}
