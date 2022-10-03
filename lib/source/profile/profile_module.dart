import 'package:firebase_login_app/common/navigator_status.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_bloc.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_event.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_state.dart';
import 'package:firebase_login_app/source/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileModule extends StatelessWidget {
  const ProfileModule({super.key});

  static const route = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        authRepository: context.read(),
      )..add(InitProfileEvent()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.status is OnSignIn) {
            Navigator.of(context).pop();
          } else if (state.status is OnSettings) {
            //TODO: settings view
          } else if (state.status is OnUploadPhoto) {
            //TODO: upload photo
          }
        },
        builder: (context, state) {
          return ProfileView(
            context,
            state,
          );
        },
      ),
    );
  }
}
