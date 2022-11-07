import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class main_home extends StatefulWidget {
  const main_home({super.key});

  @override
  State<main_home> createState() => _main_homeState();
}

class _main_homeState extends State<main_home> {
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: Text("SIGN OUT"),
        onPressed: () async {
          storage.delete(key: 'token');
          Navigator.pushReplacementNamed(context, '/home_page_redirector');
          log("Signing Out");
        },
      )),
    );
  }
}
