import 'package:flutter/material.dart';
import 'screens/splashpage/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(0, 100, 145, 1),
        textTheme: Typography().white,
      ),
      home: const Scaffold(body: Splashscreen(),
      ),
    );
  }
}
