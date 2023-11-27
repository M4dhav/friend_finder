import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
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
  print(loca.latitude);
  print(loca.longitude);
  for (var block in locas.keys) {
    print(block);
    for (var j = 0; j < locas[block]!.length; j++) {
      print(locas[block]?[j][0][0] as double);
      print(locas[block]?[j][0][1] as double);
      print(locas[block]?[j][1][0] as double);
      print(locas[block]?[j][1][1] as double);
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
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocator',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Geolocator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = "Start";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _counter = await _determinePosition();
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
