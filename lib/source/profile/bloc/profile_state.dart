import 'package:firebase_login_app/common/navigator_status.dart';
import 'package:flutter/material.dart';

abstract class InitialProfileState {}

class ProfileState extends InitialProfileState {
  final Icon? userImage;
  final String? userName;
  final String? userEmail;
  final String? aboutUser;
  NavigatorStatus status;

  ProfileState({
    this.userImage,
    this.userEmail,
    this.aboutUser,
    this.userName,
    this.status = const InitialNavigatorStatus(),
  });

  ProfileState copyWith({
    Icon? userImage,
    String? userName,
    String? userEmail,
    String? aboutUser,
    NavigatorStatus? status,
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
