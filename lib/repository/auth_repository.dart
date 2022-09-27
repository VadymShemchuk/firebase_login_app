import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_app/model/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  void signUpUser(String email, String password) async {
    try {
      var user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user.user != null) {
        UserModel.copyWith(
          user.user!.email!,
          null,
          null,
        );
      }
    } on FirebaseAuthException catch (e) {
      AuthRepositoryFailExeption.copyWith(e.message);
    } catch (_) {
      AuthRepositoryFailExeption();
    }
  }

  Future<void> signInUser(String email, String password) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user.user != null) {
        UserModel(user.user!.email!);
      }
    } on FirebaseAuthException catch (e) {
      AuthRepositoryFailExeption.copyWith(e.message);
    } catch (_) {
      AuthRepositoryFailExeption();
    }
  }

  void signOut() {
    _firebaseAuth.signOut();
  }

  UserModel? getUser() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return UserModel.copyWith(
        user.email!,
        null,
        null,
      );
    } else {
      return null;
    }
  }
}

class AuthRepositoryFailExeption implements Exception {
  final String? message;

  AuthRepositoryFailExeption([this.message = 'An unknown exception occurred.']);

  factory AuthRepositoryFailExeption.copyWith(String? message) {
    return AuthRepositoryFailExeption(message);
  }
}
