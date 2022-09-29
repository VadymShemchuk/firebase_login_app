import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_event.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_state.dart';
import 'package:firebase_login_app/utils/validator_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignInState()) {
    on<ChangeEmailEvent>(_onEmailChanged);
    on<ChangePasswordEvent>(_onPasswordChange);
    // on<KeepSingInEvent>(_onKeepSingInCheckbox);
    on<SubmitSignInEvent>(_onSubmitted);
    on<ChangeSecureEvent>(_onChangeSecure);
  }

  final AuthRepository _authRepository;

  void _onEmailChanged(
    ChangeEmailEvent event,
    Emitter<SignInState> emit,
  ) {
    String? email = event.email;
    emit(state.copyWith(
      email: email,
    ));
  }

  void _onPasswordChange(
    ChangePasswordEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  // void _onKeepSingInCheckbox(
  //   KeepSingInEvent event,
  //   Emitter<SignInState> emit,
  // ) {
  //   //emit(state.copyWith(keepSignIn: event.keepSignIn = !event.keepSignIn));
  // }

  void _onChangeSecure(
    ChangeSecureEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(
        changeSecureIcon: state.changeSecureIcon = !state.changeSecureIcon));
    print('${state.changeSecureIcon}');
  }

  void _onSubmitted(
    SubmitSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    //emit(state.copyWith(status: ProgressSignInStatus()));

    bool? isEmailValid = ValidatorUtil.isEmailValid(state.email);
    bool? isPasswordValid = ValidatorUtil.isPasswordValid(state.password);
    if (!isEmailValid || !isPasswordValid) {
      String? emailError = ValidatorUtil.emailError(state.email);
      String passwordError = ValidatorUtil.passwordError(state.password);
      emit(state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
      ));
    } else {
      try {
        await _authRepository.signInUser(
          state.email,
          state.password,
        );
        emit(SuccsessSingInState());
      } on AuthRepositoryFailExeption catch (e) {
        emit(FailureSignInState(error: e.message));
      } catch (_) {
        emit(FailureSignInState());
      }
    }
  }
}
