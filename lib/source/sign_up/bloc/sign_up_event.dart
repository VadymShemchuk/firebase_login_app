abstract class SignUpEvent {}

class SignUpNameChanged extends SignUpEvent {
  final String name;

  SignUpNameChanged(this.name);
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  SignUpEmailChanged(this.email);
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;

  SignUpPasswordChanged(this.password);
}

class SignUpSibmitted extends SignUpEvent {}

class SignUpChangeSecure extends SignUpEvent {}

class OnSignInEvent extends SignUpEvent {}
