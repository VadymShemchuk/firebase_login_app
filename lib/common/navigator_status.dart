abstract class NavigatorStatus {
  const NavigatorStatus();
}

class InitialNavigatorStatus extends NavigatorStatus {
  const InitialNavigatorStatus();
}

class ProgressAuth extends NavigatorStatus {}

class SuccessAuth extends NavigatorStatus {}

class FailureAuth extends NavigatorStatus {
  final String? error;

  FailureAuth({this.error});
}

class OnSignUp extends NavigatorStatus {}

class OnSignIn extends NavigatorStatus {}

class OnSettings extends NavigatorStatus {}

class OnUploadPhoto extends NavigatorStatus {}
