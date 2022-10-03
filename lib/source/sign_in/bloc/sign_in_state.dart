import 'package:firebase_login_app/common/auth_status.dart';

class SignInState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  bool changeSecureIcon;
  bool isEmailValid;
  bool isPasswordValid;
  AuthStatus status;

  SignInState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.changeSecureIcon = true,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.status = const InitialAuthStatus(),
  });

  SignInState copyWith({
    String? emailError,
    String? passwordError,
    String? email,
    String? password,
    bool? changeSecureIcon,
    bool? isEmailValid,
    bool? isPasswordValid,
    AuthStatus? status,
  }) {
    return SignInState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      changeSecureIcon: changeSecureIcon ?? this.changeSecureIcon,
      status: status ?? this.status,
    );
  }
}
