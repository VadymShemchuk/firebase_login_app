import 'package:flutter/material.dart';

class UserAvatar {
  const UserAvatar._();

  static Widget buildAvatar({
    required void Function()? onTap,
  }) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 95,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        const Positioned(
          child: Icon(
            Icons.account_circle,
            size: 110,
            color: Colors.black26,
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(31, 31, 0),
          child: Container(
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(31, 31, 0),
          child: Container(
            height: 27,
            decoration: const BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Transform(
            transform: Matrix4.translationValues(30.5, 30.5, 0),
            child: GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.blue,
                size: 18,
              ),
            ))
      ],
    );
  }
}
