import 'package:firebase_login_app/common/repository/auth_repository.dart';
import 'package:firebase_login_app/common/navigator_status.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_event.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_state.dart';
import 'package:firebase_login_app/utils/validator_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SignUpState()) {
    on<SignUpNameChanged>(_onNameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpSibmitted>(_onSubmitted);
    on<SignUpChangeSecure>(_onChangeSecure);
    on<OnSignInEvent>(_onSignIn);
  }

  final AuthRepository _authRepository;

  void _onNameChanged(
    SignUpNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      name: event.name,
    ));
  }

  void _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void _onChangeSecure(
    SignUpChangeSecure event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
        changeSecureIcon: state.changeSecureIcon = !state.changeSecureIcon));
  }

  void _onSignIn(
    OnSignInEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(status: OnSignIn()));
  }

  void _onSubmitted(
    SignUpSibmitted event,
    Emitter<SignUpState> emit,
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
        // ignore: unused_local_variable
        bool isSignUp = await _authRepository.signUpUser(
          state.email,
          state.password,
          state.name,
        );
        if (isSignUp = true) {
          emit(state.copyWith(status: SuccessAuth()));
        } else {
          emit(state.copyWith(
              status: FailureAuth(error: 'Something went wrong')));
        }
      } on AuthRepositoryFailExeption catch (e) {
        emit(state.copyWith(status: FailureAuth(error: e.message)));
      } catch (_) {
        emit(state.copyWith(status: FailureAuth()));
      }
    }
  }
}
