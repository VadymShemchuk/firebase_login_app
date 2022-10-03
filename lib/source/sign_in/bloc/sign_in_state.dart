import 'package:firebase_login_app/common/navigator_status.dart';

class SignInState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;
  bool changeSecureIcon;
  bool isEmailValid;
  bool isPasswordValid;
  NavigatorStatus status;

  SignInState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.changeSecureIcon = true,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.status = const InitialNavigatorStatus(),
  });

  SignInState copyWith({
    String? emailError,
    String? passwordError,
    String? email,
    String? password,
    bool? changeSecureIcon,
    bool? isEmailValid,
    bool? isPasswordValid,
    NavigatorStatus? status,
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
