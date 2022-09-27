import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_event.dart';
import 'package:firebase_login_app/source/sign_in/bloc/sign_in_state.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SignInState()) {
    on<ChangeEmailEvent>(_onEmailChanged);
    on<ChangePasswordEvent>(_onPasswordChange);
    on<KeepSingInEvent>(_onKeepSingInCheckbox);
    on<SubmitSignInEvent>(_onSubmitted);
  }

  final AuthRepository _authRepository;

  void _onEmailChanged(
    ChangeEmailEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(
    ChangePasswordEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onKeepSingInCheckbox(
    KeepSingInEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(keepSignIn: event.keepSignIn = !event.keepSignIn));
  }

  void _onSubmitted(
    SubmitSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: ProgressSignInStatus()));
    try {
      await _authRepository.signInUser(
        state.email,
        state.password,
      );
      emit(state.copyWith(
        status: SuccessSignInStatus(),
      ));
    } on AuthRepositoryFailExeption catch (e) {
      emit(state.copyWith(
        error: e.message,
        status: FailedSignInStatus(),
      ));
    } catch (_) {
      emit(state.copyWith(
        status: FailedSignInStatus(),
      ));
    }
  }
}
