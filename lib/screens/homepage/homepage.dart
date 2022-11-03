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
    // final size = MediaQuery.of(context).size -30.0 ;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 40.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    textgenerator('Foodora', 55.0, 'FoodoraFont', 700),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: textgenerator(
                          'for bussiness', 25.0, 'FoodoraFont', 400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                svggenerator(
                  350,
                  350,
                  'assets/svg/logo.svg',
                ),
                const SizedBox(
                  height: 30,
                ),
                buttongenerator('Sign In', context, () {
                  Navigator.pushNamed(context, '/siginpage');
                }),
                const SizedBox(
                  height: 30,
                ),
                buttongenerator('New Restraunt', context, () {
                  Navigator.pushNamed(context, '/newrestaraunt');
                }),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("Code Of Conduct",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      Text("Terms Of Service",
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                      Text("Privacy Policy",
                          style:
                              TextStyle(decoration: TextDecoration.underline))
                    ],
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
