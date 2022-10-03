import 'package:firebase_login_app/source/profile/bloc/profile_bloc.dart';
import 'package:firebase_login_app/source/profile/bloc/profile_event.dart';
import 'package:firebase_login_app/source/profile/profile_module.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_module.dart';
import 'package:firebase_login_app/source/splash/bloc/splash_bloc.dart';
import 'package:firebase_login_app/source/splash/bloc/splash_event.dart';
import 'package:firebase_login_app/source/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashModule extends StatelessWidget {
  const SplashModule({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_) => SplashBloc(
                context.read(),
              )..add(UnknownAuthorization()),
          child: BlocConsumer<SplashBloc, SplashState>(
              builder: (context, _) => const Center(
                    child: CircularProgressIndicator(),
                  ),
              listener: (context, state) {
                if (state is Authenticated) {
                  Navigator.of(context)
                      .pushReplacementNamed(ProfileModule.route);
                } else if (state is AuthenticationRequired) {
                  Navigator.of(context)
                      .pushReplacementNamed(SignInModule.route);
                }
              })),
    );
  }
}
