import 'package:flutter/material.dart';
import 'package:friend_finder/login_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:appwrite/appwrite.dart';

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
    await account.createOAuth2Session(provider: 'microsoft');
    // Additional logic after OAuth2 session creation if needed
  }
}

void main() async {
  runApp(MyApp());
}

var locas = {
  "A Block": [
    [
      [28.450681795610162, 77.58363834137602],
      [28.45021147520149, 77.58447638801496],
    ]
  ],
  "B Block": [
    [
      [28.449901853357833, 77.58420970617611],
      [28.449429744662652, 77.58507266691117],
    ]
  ],
  "N Block": [
    [
      [28.448625753879796, 77.58271589857746],
      [28.449084838996665, 77.58454125544061],
    ],
    [
      [28.449499133610818, 77.58360735192923],
      [28.44923040215414, 77.58402760850936],
    ]
  ],
  "Sports Complex": [
    [
      [28.45019551330674, 77.58674809324677],
      [28.44987711084939, 77.58799174676149],
    ]
  ],
  "Football Field": [
    [
      [28.449525441885342, 77.58555922632736],
      [28.449456503894968, 77.58724798321825],
    ]
  ],
  "Mess": [
    [
      [28.45073450088025, 77.58577635218293],
      [28.450432237429567, 77.58681976269052],
    ]
  ],
  "N Block Ground": [
    [
      [28.448995799758805, 77.58239812014611],
      [28.44924223882021, 77.5837602955713]
    ]
  ]
};

bool isCoordinateInsideRectangle(double lat1, double lon1, double lat2,
    double lon2, double targetLat, double targetLon) {
  if ((lat1 <= targetLat && targetLat <= lat2 ||
          lat2 <= targetLat && targetLat <= lat1) &&
      (lon1 <= targetLon && targetLon <= lon2 ||
          lon2 <= targetLon && targetLon <= lon1)) {
    return true;
  } else {
    return false;
  }
}

Future<String> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  var loca = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  for (var block in locas.keys) {
    for (var j = 0; j < locas[block]!.length; j++) {
      if (isCoordinateInsideRectangle(
          locas[block]?[j][0][0] as double,
          locas[block]?[j][0][1] as double,
          locas[block]?[j][1][0] as double,
          locas[block]?[j][1][1] as double,
          loca.latitude,
          loca.longitude)) {
        return block;
      }
    }
  }
  return "None";
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(
      //   title: 'Geolocator',
      // ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = "Start";
  AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller._performOAuth2Login();
          // _counter = await _determinePosition();
          // setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
