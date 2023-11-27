import 'package:flutter/material.dart';
import 'package:friendfinder/constants.dart';

class BottomButtons extends StatelessWidget {
  BottomButtons(
      {required this.title, required this.onPress, required this.btnColor});

  final String title;
  final Function onPress;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: kBottomBtnTextStyle,
      ),
      onPressed: () {
        onPress;
      },
      style: TextButton.styleFrom(
          backgroundColor: btnColor, minimumSize: Size(155, 48)),
    );
  }
}
