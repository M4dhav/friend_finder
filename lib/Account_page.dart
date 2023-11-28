import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/ThemeChanger.dart';

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
          ImageIcon(
            // profile image to be displayed
            AssetImage('assets/profile.png'),
            size: 200.0,
          ),

          //friend name
          Text(
            'username',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          //friend id
          Text(
            'id',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 30,
          ),

          //ID copy
          GestureDetector(
            onTap: () {
              _copyToClipboard(context, 'text');
            },
            child: Card(
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
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Theme changer
          ThemeChanger(),

          // Logout and Delete buttons
          TextButton(
            child: Text(
              'Log Out',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: Colors.black, minimumSize: Size(155, 48)),
          ),
          SizedBox(height: 30),
          TextButton(
            child: Text(
              'Delete Account',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
            style: TextButton.styleFrom(
                backgroundColor: Color(0xFFFF5B5B), minimumSize: Size(155, 48)),
          ),
        ],
      ),
    );
  }
}
