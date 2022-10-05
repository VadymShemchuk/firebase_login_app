import 'package:firebase_login_app/source/profile/profile_settings/bloc/settings_event.dart';
import 'package:firebase_login_app/source/profile/profile_settings/bloc/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSettingsBloc
    extends Bloc<ProfileSettingsEvent, ProfileSettingsState> {
  ProfileSettingsBloc() : super(ProfileSettingsState());
}
