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
  var emailmessage = '';
  var passwordmessage = '';
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
              Row(
                children: [
                  Container(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: svggenerator(300, 300, 'assets/svg/Fingerprint.svg'),
                  ),
                  InputFieldgenerator('Enter Your Email'),
                  SizedBox(
                    height: 25.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        errortextgenerator(emailmessage, 15, 300),
                      ],
                    ),
                  ),
                  InputFieldgenerator('Password'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      errortextgenerator(passwordmessage, 15, 400),
                      Textlink(
                          'Forgot Password', 15, context, 300, Colors.white,
                          () {
                        Navigator.pushNamed(context, '/forgotpass');
                      }),
                    ],
                  ),
                  buttongenerator('Sign In', context, () {
                    // Navigator.pushReplacementNamed(context, '/siginpage');
                    setState(() {
                      passwordmessage = 'Invalid Password';
                      emailmessage = 'Invalid Email';
                    });
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textgenerator(
                          'New user?', 25, 'Raleway', 400, Colors.white),
                      Textlink('Register', 28, context, 800,
                          const Color.fromRGBO(50, 81, 255, 1), () {
                        Navigator.pushNamed(context, '/newregister');
                      })
                    ],
                  ),
                  Column(
                    children: [
                      svggenerator(140, 360, 'assets/svg/bottompage.svg'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
