import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/CopyToClipboard.dart';
import '../components/AccountInfo.dart';
import '../components/ThemeChanger.dart';
import '../components/BottomButton.dart';

// function to copy id/text
void _copyToClipboard(context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Id copied to clipboard'),
    ),
  );
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // call AccountInfo for friend info
          AccountInfo(
              profile: 'images/pooh.png', username: 'ABC', id: 'xxxxxxxx'),

          SizedBox(
            height: 30,
          ),

          //ID copy
          GestureDetector(
            onTap: () {
              _copyToClipboard(context, 'text');
            },
            child: CopyCard(),
          ),

          //Theme changer
          ThemeChanger(),

          // Logout and Delete buttons
          BottomButtons(
              title: 'Log Out', onPress: () {}, btnColor: Colors.black),
          SizedBox(height: 30),
          BottomButtons(
              btnColor: Color(0xFFFF5B5B),
              onPress: () {},
              title: 'Delete Account'),
        ],
      ),
    );
  }
}
