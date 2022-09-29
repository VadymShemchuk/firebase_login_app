abstract class SignInEvent {}

class ChangeEmailEvent extends SignInEvent {
  final String email;

  ChangeEmailEvent(this.email);
}

class ChangePasswordEvent extends SignInEvent {
  final String password;

  ChangePasswordEvent(this.password);
}

class ChangeSecureEvent extends SignInEvent {}

class SubmitSignInEvent extends SignInEvent {}
