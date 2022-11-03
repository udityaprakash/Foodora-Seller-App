// ignore_for_file: sized_box_for_whitespace, unnecessary_import

import 'dart:ui';
import 'package:flutter_svg/svg.dart';
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
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        // color: Colors.blue,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Color.fromRGBO(50, 81, 255, 1),
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/logo.svg',
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:25.0),
                        child:
                            textgenerator('Foodora', 50.0, 'FoodoraFont', 700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: textgenerator(
                            'for bussiness', 22.0, 'FoodoraFont', 400),
                      ),
                    ],
                  ),
                  textgenerator('Take Your Restraunt Bussiness to Pinnacle', 16, 'Raleway', 800),
                  const SizedBox(
                    height: 25.0,
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
