import 'package:firebase_login_app/source/sign_in/sign_in_status.dart';

class SignUpState {
  final String? name;
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  bool changeSecureIcon;
  bool isEmailValid;
  bool isPasswordValid;
  AuthStatus status;

  SignUpState({
    this.name,
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.changeSecureIcon = true,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.status = const InitialAuthStatus(),
  });

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? changeSecureIcon,
    bool? isEmailValid,
    bool? isPasswordValid,
    AuthStatus? status,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      changeSecureIcon: changeSecureIcon ?? this.changeSecureIcon,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      status: status ?? this.status,
    );
  }
}
