import 'package:firebase_login_app/common/repository/providers.dart';
import 'package:firebase_login_app/source/profile/profile_module.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_module.dart';
import 'package:firebase_login_app/source/sign_up/sign_up_module.dart';
import 'package:firebase_login_app/source/splash/bloc/splash_module.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.blueGrey,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            buttonTheme: const ButtonThemeData(buttonColor: Colors.blue)),
        initialRoute: SplashModule.route,
        routes: {
          SplashModule.route: (_) => const SplashModule(),
          SignInModule.route: (_) => const SignInModule(),
          SignUpModule.route: (_) => const SignUpModule(),
          ProfileModule.route: (_) => const ProfileModule(),
        },
      ),
    );
  }
}
