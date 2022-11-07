import 'package:flutter/material.dart';

import '../../config/api_integration.dart';
import '../desigining.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  bool _isloading = false;
  var emailmessage = '';
  TextEditingController _emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 35,
            child: Stack(children: [
              Bottomgradient(context),
              Backgroundimg(context),
              ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
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
                              'assets/svg/Forgot_pass.svg'),
                        ),
                        textgenerator(
                          'Forgot Password',
                          MediaQuery.of(context).size.width / 14,
                          'Raleway',
                          700,
                          Color.fromRGBO(50, 81, 255, 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 30),
                          child: textgenerator(
                            'Please enter your Email to verify',
                            MediaQuery.of(context).size.width / 20,
                            'Raleway',
                            400,
                            Colors.white,
                          ),
                        ),
                        InputFieldgenerator('Email Address', context,
                            controller: _emailController),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 23,
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                                alignment: Alignment.topLeft,
                                child:
                                    errortextgenerator(emailmessage, 15, 400))),
                        _isloading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    color: blue_background),
                              )
                            : SizedBox(height: 20),
                        SizedBox(height: 10),
                        buttongenerator(
                          'Continue',
                          context,
                          () async {
                            if (isEmail(_emailController.text)) {
                              emailmessage = '';
                              setState(() {
                                _isloading = true;
                              });
                              final response =
                                  await forget_otp_send(_emailController.text);

                              setState(() {
                                _isloading = false;
                              });

                              if (response['success']) {
                                Navigator.of(context).pushReplacementNamed(
                                    '/otppage',
                                    arguments: _emailController.text);
                              } else {
                                setState(() {
                                  emailmessage = response['msg'];
                                });
                              }
                            } else {
                              setState(() {
                                emailmessage = "Invalid Email";
                              });
                            }
                            ;
                          },
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
    ;
  }
}
