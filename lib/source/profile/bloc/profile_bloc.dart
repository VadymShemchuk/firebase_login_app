import 'package:firebase_login_app/common/navigator_status.dart';
import 'package:firebase_login_app/common/repository/auth_repository.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_event.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ProfileState()) {
    on<InitProfileEvent>(_getUser);
    on<LogOutProfileEvent>(_onLogOut);
    on<SettingsProfileEvent>(_onSettings);
    on<AddPhotoProfileEvent>(_addPhoto);
  }

  final AuthRepository _authRepository;

  void _getUser(
    InitProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    final user = _authRepository.getUser();
    if (user != null) {
      emit(state.copyWith(
        userName: user.name,
        userEmail: user.email,
      ));
    }
  }

  void _onLogOut(
    LogOutProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    _authRepository.signOut();
    emit(
      state.copyWith(
        status: OnSignIn(),
      ),
    );
  }

  void _onSettings(
    SettingsProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      state.copyWith(
        status: OnSettings(),
      ),
    );
  }

  void _addPhoto(
    AddPhotoProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(
      state.copyWith(
        status: OnUploadPhoto(),
      ),
    );
  }
}
