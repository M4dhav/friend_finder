import 'package:flutter/material.dart';
import 'package:friendfinder/constants.dart';

class CopyCard extends StatelessWidget {
  const CopyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50,
      elevation: 1.0,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: ListTile(
          leading: Icon(
            Icons.copy_rounded,
            color: Colors.blue,
            size: 25.0,
          ),
          title: Text(
            'Copy ID to Clipboard',
            style: kClipboardTextStyle,
          ),
        ),
      ),
    );
  }
}
