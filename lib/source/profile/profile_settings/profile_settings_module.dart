import 'package:firebase_login_app/source/profile/profile_settings/bloc/settings_bloc.dart';
import 'package:firebase_login_app/source/profile/profile_settings/bloc/settings_state.dart';
import 'package:firebase_login_app/source/profile/profile_settings/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSettingsModule extends StatelessWidget {
  const ProfileSettingsModule({super.key});

  static const route = '/ProfileSettings';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileSettingsBloc(),
      child: BlocConsumer<ProfileSettingsBloc, ProfileSettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return const ProfileSettingsView();
        },
      ),
    );
  }
}
