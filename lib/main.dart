import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBkCKQXztCGXDnTTd_nacB8hltvtorfWPQ",
    storageBucket: 'iot-led-control-7305e.appspot.com',
    appId: "1:372169876475:android:6a474f75769ba89340615e",
    messagingSenderId:
        "372169876475-knoim2e4qcnbbrnnceiem7ihali8htfv.apps.googleusercontent.com",
    projectId: "iot-led-control-7305e",
  ));

  /// FirebaseAnalytics.instance.logAppOpen();

  /// await dotenv.load(fileName: "assets/.env");

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'IOT Leds Control',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool on = false;
  final dbR = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          title: Text(widget.title,style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              on
                  ? const Icon(
                      Icons.lightbulb,
                      color: Colors.yellow,
                      size: 100,
                    )
                  : const Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                      size: 100,
                    ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    setState(() {
                      on = !on;
                    });
                    dbR.child("Light").set({"value": on});
                  },
                  child: Text(
                    on ? "Allumé" : "Etteint",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ))
            ],
          ),
        ));
  }
}
