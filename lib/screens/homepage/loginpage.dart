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
  bool _passwordVisible = true;
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 40.0,
          child: Stack(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Backgroundimg(context),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:18.0),
                  child: Toppageicon(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: svggenerator(
                            MediaQuery.of(context).size.height / 2.5,
                            MediaQuery.of(context).size.width / 0.7,
                            'assets/svg/Fingerprint.svg'),
                      ),
                      InputFieldgenerator('Enter Your Email', context),
                      SizedBox(
                        height: 25.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            errortextgenerator(emailmessage, 15, 300),
                          ],
                        ),
                      ),
                      Inputpassfield(
                        'Password',
                        _passwordVisible,
                        context,
                        () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
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
                            Navigator.pushReplacementNamed(
                                context, '/newregister');
                          })
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
