import 'package:flutter/material.dart';
import '../constants.dart';

class TopButtons extends StatelessWidget {
  TopButtons(
      {required this.title,
      required this.onPress,
      required this.fcolor,
      required this.bcolor});
  final String title;
  final Color fcolor, bcolor;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        title,
        style: kTopBtnTextStyle,
      ),
      onPressed: () {
        onPress;
      },
      style: TextButton.styleFrom(
        minimumSize: Size(155, 48),
        backgroundColor: bcolor,
        foregroundColor: fcolor,
      ),
    );
  }
}
