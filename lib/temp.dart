void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('6599a1b27392e1dddc61')
    .setSelfSigned(status: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(client: client),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Client client;

  MyHomePage({required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await MicrosoftSignin(client,context);
          },
          child: const Text('Login with Outlook'),
        ),
      ),
    );
  }

  Future<void> MicrosoftSignin(Client client,BuildContext context) async {
    try {
      // Create Microsoft OAuth2 session
        await Account(client).createOAuth2Session(provider: 'microsoft');
      // Wait for a short duration (you can remove this delay if not needed)
      await Future.delayed(const Duration(milliseconds: 500));

      // Get the current user after authentication
      User? user = await getCurrentUser(client);

      if (user != null) {
        // Successful login, navigate to the next screen (replace with your logic)
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginedPage(user: user)));
      } else {
        // Failed to get user, handle the error (replace with your logic)
        print('Failed to login');
      }
    } on AppwriteException catch (e) {
      // Handle Appwrite exceptions (replace with your error handling logic)
      print('Appwrite Exception: ${e.message}');
    }
  }

  Future<User?> getCurrentUser(Client client) async {
    try {
      // Get the current user details
      Account account = Account(client);
      return await account.get();
    } on AppwriteException catch (e) {
      // Handle Appwrite exceptions (replace with your error handling logic)
      print('Appwrite Exception: ${e.message}');
      return null;
    }
  }