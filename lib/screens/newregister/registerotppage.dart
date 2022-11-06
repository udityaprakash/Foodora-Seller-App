import 'package:flutter/material.dart';

import '../desigining.dart';

class Myotppage extends StatefulWidget {
  final String email;
  const Myotppage({super.key, required this.email});

  @override
  State<Myotppage> createState() => _MyotppageState();
}

class _MyotppageState extends State<Myotppage> {
  late String _pin;
  bool? _full_Otp;
  String _error_line = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 35,
            child: Stack(
              children: [
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
                                MediaQuery.of(context).size.height / 2.7,
                                MediaQuery.of(context).size.width / 0.7,
                                'assets/svg/Enter_OTP.svg'),
                          ),
                          textgenerator(
                            'Enter OTP',
                            MediaQuery.of(context).size.width / 14,
                            'Raleway',
                            700,
                            Colors.white,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          textgenerator(
                            'Enter OTP Sent at \n' + widget.email,
                            MediaQuery.of(context).size.width / 20,
                            'Raleway',
                            400,
                            Colors.white,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          otp_field(context, function: (pin) {
                            _pin = pin;
                            if (pin.toString().isEmpty) {
                              _full_Otp = null;
                            } else {
                              if (pin.toString().length == 6) {
                                _full_Otp = true;
                                setState(() {
                                  _error_line = " ";
                                });
                              } else {
                                _full_Otp = false;
                                setState(() {
                                  _error_line = "Please Enter Entire OTP";
                                });
                              }
                            }

                            setState(() {});
                          }),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child:
                                    errortextgenerator(_error_line, 15, 400)),
                          ),
                          buttongenerator("Verify", context, () {
                            if (_full_Otp == null) {
                              setState(() {
                                _error_line = "Enter Full OTP";
                                // _full_Otp = false;
                              });
                            }
                            if (_full_Otp == true) {
                              // Navigator.of(context)
                              //     .pushReplacementNamed("/________");
                            }
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
