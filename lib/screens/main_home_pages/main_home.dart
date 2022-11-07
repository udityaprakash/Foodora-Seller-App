import 'package:flutter/material.dart';

class main_home extends StatefulWidget {
  const main_home({super.key});

  @override
  State<main_home> createState() => _main_homeState();
}

class _main_homeState extends State<main_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("main_home")),
    );
  }
}
