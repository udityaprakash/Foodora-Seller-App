// ignore_for_file: sized_box_for_whitespace, unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/homepage/newsellerpage.dart';
import '../desigining.dart';
import 'loginpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    textgenerator('Foodora', 55.0, 'FoodoraFont',700),
                     Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: textgenerator('for bussiness', 25.0, 'FoodoraFont',400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60.0,
                ),
                svggenerator(350,350,
                'assets/svg/logo.svg',
              ),
                const SizedBox(
                  height: 30,
                ),
                buttongenerator('login', context,(){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()),
                    );}),
                const SizedBox(
                  height: 30,
                ),
                buttongenerator('new seller', context,(){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Newsellerpage()),
                    );}),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("Code Of Conduct",
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                        Text("Terms Of Service",
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                        Text("Privacy Policy",
                            style:
                                TextStyle(decoration: TextDecoration.underline))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
