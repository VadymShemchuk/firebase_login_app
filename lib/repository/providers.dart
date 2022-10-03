import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_app/common/model/user_model.dart';
import 'package:firebase_login_app/repository/auth_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider<FirebaseAuth>(create: (_) => FirebaseAuth.instance),
  Provider<UserModel>(create: (_) => UserModel()),
  ProxyProvider<FirebaseAuth, AuthRepository>(
    update: (context, firebaseAuth, _) => AuthRepository(firebaseAuth),
  ),
];
