import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_app/model/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  void signUpUser(
    String email,
    String password,
    String? name,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null && name != null) {
        await updateUserNameAndPhoto(name, null);
        UserModel.copyWith(
          user.email,
          user.displayName,
          null,
        );
      } else if (user != null && name == null) {
        UserModel.copyWith(
          user.email,
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
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      final user = userCredential.user;
      if (user != null) {
        UserModel.copyWith(
          user.email,
          user.displayName,
          user.photoURL,
        );
      }
    } on FirebaseAuthException catch (e) {
      throw AuthRepositoryFailExeption.copyWith(e.message);
    } catch (_) {
      throw AuthRepositoryFailExeption();
    }
  }

  Future<void> updateUserNameAndPhoto(
    String? name,
    String? photo,
  ) async {
    if (_firebaseAuth.currentUser == null) return;
    if (name != null) {
      await _firebaseAuth.currentUser!.updateDisplayName(name);
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        UserModel.copyWith(
          user.email,
          user.displayName,
          user.photoURL,
        );
      }
    } else if (photo != null) {
      await _firebaseAuth.currentUser!.updatePhotoURL(name);
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        UserModel.copyWith(
          user.email,
          user.displayName,
          user.photoURL,
        );
      }
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
        user.displayName,
        user.photoURL,
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
