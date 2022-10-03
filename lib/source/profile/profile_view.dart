import 'package:firebase_login_app/source/profile/bloc/profile_bloc.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_event.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_state.dart';
import 'package:firebase_login_app/utils/text_field_util.dart';
import 'package:firebase_login_app/utils/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView(
    this.context,
    this.state, {
    Key? key,
  }) : super(key: key);
  final BuildContext context;
  final ProfileState state;

  @override
  Widget build(_) {
    final userName = state.userName ?? 'User Name';
    final userEmail = state.userEmail ?? 'User Email';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.read<ProfileBloc>().add(
                            LogOutProfileEvent(),
                          ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () => context.read<ProfileBloc>().add(
                            SettingsProfileEvent(),
                          ),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: UserAvatar.buildAvatar(
                    onTap: () => context.read<ProfileBloc>().add(
                          AddPhotoProfileEvent(),
                        ),
                  ),
                ),
              ),
              TextFieldUtil.buildStaticText(
                text: 'Hi! $userName',
                fontSize: 24,
              ),
              TextFieldUtil.buildStaticText(
                text: userEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
