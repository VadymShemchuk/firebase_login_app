import 'package:firebase_login_app/common/auth_status.dart';
import 'package:flutter/material.dart';

abstract class InitialProfileState {}

class ProfileState extends InitialProfileState {
  final Icon? userImage;
  final String? userName;
  final String? userEmail;
  final String? aboutUser;
  AuthStatus status;

  ProfileState({
    this.userImage,
    this.userEmail,
    this.aboutUser,
    this.userName,
    this.status = const InitialAuthStatus(),
  });

  ProfileState copyWith({
    Icon? userImage,
    String? userName,
    String? userEmail,
    String? aboutUser,
    AuthStatus? status,
  }) {
    return ProfileState(
      userImage: userImage ?? this.userImage,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      aboutUser: aboutUser ?? this.aboutUser,
      status: status ?? this.status,
    );
  }
}
