abstract class SignInEvent {}

class SignInEmailChanged extends SignInEvent {
  final String email;

  SignInEmailChanged(this.email);
}

class SignInPasswordChanged extends SignInEvent {
  final String password;

  SignInPasswordChanged(this.password);
}

class SignInChangeSecure extends SignInEvent {}

class SignInSubmitted extends SignInEvent {}

class OnSignUpEvent extends SignInEvent {}
