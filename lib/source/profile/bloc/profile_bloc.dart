import 'package:firebase_login_app/common/auth_status.dart';
import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_event.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(ProfileState()) {
    on<InitProfileEvent>(_getUser);
  }

  final AuthRepository _authRepository;

  void _getUser(
    InitProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    print('init User');
    final user = _authRepository.getUser();
    if (user != null) {
      print('user ${user.email}');
      emit(state.copyWith(
        status: UploadAuthStatus(),
        userName: user.name,
        userEmail: user.email,
      ));
    }
  }
}
