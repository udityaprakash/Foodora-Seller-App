// ignore_for_file: sized_box_for_whitespace, unnecessary_import
import 'dart:ui';
import 'package:flutter/material.dart';
import '../desigining.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 40.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Toppageicon(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: textgenerator(
                          'Foodora',
                          MediaQuery.of(context).size.width / 8,
                          'FoodoraFont',
                          700,
                          Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 48),
                      child: textgenerator(
                          'for bussiness',
                          MediaQuery.of(context).size.width / 15,
                          'FoodoraFont',
                          400,
                          Colors.white),
                    ),
                  ],
                ),
                textgenerator(
                    'Take Your Restraunt Bussiness to Pinnacle',
                    MediaQuery.of(context).size.width / 25,
                    'Raleway',
                    800,
                    Colors.white),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                svggenerator(
                  MediaQuery.of(context).size.height / 2.8,
                  MediaQuery.of(context).size.width / 0.8,
                  'assets/svg/logo.svg',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                buttongenerator('Sign In', context, () {
                  Navigator.pushNamed(context, '/siginpage');
                }),
                const SizedBox(
                  height: 30,
                ),
                buttongenerator('New Restraunt', context, () {
                  Navigator.pushNamed(context, '/newregister');
                }),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 17,
                      bottom: MediaQuery.of(context).size.width / 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Code Of Conduct",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: MediaQuery.of(context).size.width / 35),
                      ),
                      Text(
                        "Terms Of Service",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: MediaQuery.of(context).size.width / 35),
                      ),
                      Text("Privacy Policy",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: MediaQuery.of(context).size.width / 35))
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
