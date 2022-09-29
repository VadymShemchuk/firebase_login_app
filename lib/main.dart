import 'package:firebase_login_app/repository/providers.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_module.dart';
import 'package:firebase_login_app/source/sign_in/sign_in_view.dart';
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
        initialRoute: SplashModule.route,
        routes: {
          SplashModule.route: (context) => const SplashModule(),
          SignInModule.route: (context) => SignInModule(),
        },
      ),
    );
  }
}
