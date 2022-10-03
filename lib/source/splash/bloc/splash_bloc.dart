import 'package:firebase_login_app/common/repository/auth_repository.dart';
import 'package:firebase_login_app/source/splash/bloc/splash_event.dart';
import 'package:firebase_login_app/source/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._authRepository,
  ) : super(Loading()) {
    on<UnknownAuthorization>(checkUser);
  }

  final AuthRepository _authRepository;

  void checkUser(
    UnknownAuthorization event,
    Emitter<SplashState> emit,
  ) {
    final user = _authRepository.getUser();
    if (user != null) {
      emit(Authenticated());
    } else {
      emit(AuthenticationRequired());
    }
  }
}
