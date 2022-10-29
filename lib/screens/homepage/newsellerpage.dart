import 'package:flutter/material.dart';




class Newsellerpage extends StatefulWidget {
  const Newsellerpage({super.key});

  @override
  State<Newsellerpage> createState() => _NewsellerpageState();
}

class _NewsellerpageState extends State<Newsellerpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(
      child: Text('Seller page',
      style: TextStyle(
        fontFamily: 'raleway',
        fontSize: 30,
      ),
      ),
    ),
    );
  }
}