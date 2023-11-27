import 'package:flutter/material.dart';
import 'package:friendfinder/constants.dart';

class AccountInfo extends StatelessWidget {
  AccountInfo(
      {required this.profile, required this.username, required this.id});

  final String profile;
  final String username;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //profile image
        ImageIcon(
          // profile image to be displayed
          AssetImage(profile),
          size: 200.0,
        ),

        //friend name
        Text(
          username,
          style: kUsernameTextStyle,
        ),

        //friend id
        Text(
          id,
          style: kIdTextStyle,
        ),
      ],
    );
  }
}
