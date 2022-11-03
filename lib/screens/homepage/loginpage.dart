import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 40.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
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
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/Fingerprint.svg',
                    width: 350.0,
                    height: 350,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Email',
                      fillColor: Color.fromRGBO(150, 150, 150, 1.5),
                      filled: true,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      fillColor: Color.fromRGBO(150, 150, 150, 1.5),
                      filled: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textgenerator('invalid password', 10, 'Raleway', 500),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:18.0),
                        child: textgenerator(
                            'Forgot Password', 15, 'Raleway', 300),
                      ),
                    ],
                  ),
                  buttongenerator('Sign In', context, () {
                    Navigator.pushReplacementNamed(context, '/siginpage');
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
