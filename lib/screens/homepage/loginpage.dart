import 'package:flutter/material.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(
      child: Text('Login Page',
      style: TextStyle(
        fontFamily: 'raleway',
        fontSize: 30,
      ),
      ),
    ),
    );
  }
}