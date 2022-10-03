import 'package:firebase_login_app/common/model/user_model.dart';
import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:firebase_login_app/common/auth_status.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_event.dart';
import 'package:firebase_login_app/source/sign_up/bloc/sign_up_state.dart';
import 'package:firebase_login_app/utils/validator_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthRepository authRepository,
    required UserModel userModel,
  })  : _authRepository = authRepository,
        _userModel = userModel,
        super(SignUpState()) {
    on<SignUpNameChanged>(_onNameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpSibmitted>(_onSubmitted);
    on<SignUpChangeSecure>(_onChangeSecure);
    on<OnSignInEvent>(_onSignIn);
  }

  final AuthRepository _authRepository;
  final UserModel _userModel;

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
    emit(state.copyWith(status: ChangeOnSignInState()));
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
        status: ProgressAuthStatus(),
      ));
      try {
        // ignore: unused_local_variable
        bool isSignUp = await _authRepository.signUpUser(
          state.email,
          state.password,
          state.name,
        );
        if (isSignUp = true) {
          emit(state.copyWith(status: SuccessAuthStatus()));
        } else {
          emit(state.copyWith(
              status: FailureAuthStatus(error: 'Something went wrong')));
        }
      } on AuthRepositoryFailExeption catch (e) {
        emit(state.copyWith(status: FailureAuthStatus(error: e.message)));
      } catch (_) {
        emit(state.copyWith(status: FailureAuthStatus()));
      }
    }
  }
}
