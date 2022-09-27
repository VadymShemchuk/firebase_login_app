import 'package:firebase_login_app/repository/auth_repository.dart';
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
              listener: ((context, state) => {
                    if (state is Authenticated)
                      {print('authorised')}
                    else if (state is AuthenticationRequired)
                      {print('not authorized')}
                  }))),
    );
  }
}