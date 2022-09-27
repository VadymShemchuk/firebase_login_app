abstract class SignInStatus {
  const SignInStatus();
}

class InitialSignInStatus extends SignInStatus {
  const InitialSignInStatus();
}

class ProgressSignInStatus extends SignInStatus {}

class SuccessSignInStatus extends SignInStatus {}

class FailedSignInStatus extends SignInStatus {}