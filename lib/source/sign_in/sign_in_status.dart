abstract class AuthStatus {
  const AuthStatus();
}

class InitialAuthStatus extends AuthStatus {
  const InitialAuthStatus();
}

class ProgressAuthStatus extends AuthStatus {}

class SuccessAuthStatus extends AuthStatus {}

class FailureAuthStatus extends AuthStatus {
  final String? error;

  FailureAuthStatus({this.error});
}

class ChangeOnSignUpStatus extends AuthStatus {}
