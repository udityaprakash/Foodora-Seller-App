import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(10, 50.0, 10, 10),
      child: Column(
        children: [
          svggenerator(
            200,
            270,
            'assets/svg/loginpageicon.svg',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textgenerator('Foodora', 55, 'FoodoraFont', 900),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 15, 0, 0),
                child: textgenerator('for Bussiness', 25, 'FoodoraFont', 400),
              ),
            ],
          ),
          const Text(
            'Manage your restaraunt from anywhere',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 18,
              color: Color.fromARGB(255, 158, 177, 188),
              fontVariations: <FontVariation>[FontVariation('wght', 700)],
            ),
          ),
          // textgenerator('Manage your restaraunt from anywhere', 20, 'Raleway',700)
        ],
      ),
    ));
  }
}
