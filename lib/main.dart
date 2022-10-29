import 'package:flutter/material.dart';
import 'screens/splashpage/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(35, 107, 150, 1),
        textTheme: Typography().white,
      ),
      home: const SafeArea(child: Splashscreen()),
    );
  }
}
