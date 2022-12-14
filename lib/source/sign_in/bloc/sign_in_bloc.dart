import 'package:firebase_login_app/common/repository/auth_repository.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_event.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_state.dart';
import 'package:firebase_login_app/common/navigator_status.dart';
import 'package:firebase_login_app/utils/validator_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSubmitted);
    on<SignInChangeSecure>(_onChangeSecure);
    on<OnSignUpEvent>(_onChangeState);
  }

  final AuthRepository _authRepository;

  void _onEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    String? email = event.email;
    emit(state.copyWith(
      email: email,
    ));
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onChangeSecure(
    SignInChangeSecure event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
        changeSecureIcon: state.changeSecureIcon = !state.changeSecureIcon));
  }

  void _onChangeState(
    OnSignUpEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(status: OnSignUp()));
    emit(state.copyWith(status: const InitialNavigatorStatus()));
  }

  void _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    bool? isEmailValid = ValidatorUtil.isEmailValid(state.email);
    bool? isPasswordValid = ValidatorUtil.isPasswordValid(state.password);
    if (!isEmailValid || !isPasswordValid) {
      String? emailError = ValidatorUtil.emailError(state.email);
      String? passwordError = ValidatorUtil.passwordError(state.password);

      emit(state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
      ));
    } else {
      emit(state.copyWith(
        status: ProgressAuth(),
      ));
      try {
        await _authRepository.signInUser(
          state.email,
          state.password,
        );
        emit(state.copyWith(status: SuccessAuth()));
      } on AuthRepositoryFailExeption catch (e) {
        emit(state.copyWith(status: FailureAuth(error: e.message)));
      } catch (_) {
        emit(state.copyWith(status: FailureAuth()));
      }
    }
  }
}
