import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_json/view/home.dart';
import 'package:flutter_application_json/view/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyAUPiLx-XaN-QxjCVXRVnexpnhKz3wHJ5I",
      projectId: "hedef-5a1a7",
      messagingSenderId: "941341828262",
      appId: "1:941341828262:web:adaf2e378e477b8f464067",
    ));
  } else {
    await Firebase.initializeApp();
  }
  //   await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
