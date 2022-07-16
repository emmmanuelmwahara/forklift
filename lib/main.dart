import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forklift/authenticate.dart';
import 'package:forklift/home.dart';
import 'package:forklift/splash.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote forklift',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashPage.id,
      routes: {
        Authenticate.id: (context) => const Authenticate(),
        Home.id: (context) => const Home(),
        SplashPage.id: (context) => const SplashPage(),
      },
    );
  }
}
