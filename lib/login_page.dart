import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthController {
  late Client client;
  late Account account;
  AuthController() {
    client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('friend-finder')
        .setSelfSigned(status: true);
    account = Account(client);
  }

  Future<void> _performOAuth2Login() async {
    // Go to OAuth provider login page
    try {
      await account.createOAuth2Session(
        provider: 'microsoft',
      );
    } catch (PlatformException) {
      print(PlatformException);
    }
    Future result = account.get();
    await result;
    print(result);
    // Additional logic after OAuth2 session creation if needed
  }
}

class LoginPage extends StatelessWidget {
  final AuthController controller = AuthController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: Image.asset('assets/Memojis.jpg')),
              Spacer(),
              Center(child: Image.asset('assets/welome.png')),
              IconButton(
                icon: Image.asset('assets/login.png'),
                iconSize: 50,
                onPressed: () async {
                  await controller._performOAuth2Login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
