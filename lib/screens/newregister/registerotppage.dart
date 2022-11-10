import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../config/api_integration.dart';
import '../desigining.dart';

class register_otp extends StatefulWidget {
  final String email;
  const register_otp({super.key, required this.email});

  @override
  State<register_otp> createState() => _register_otpState();
}

class _register_otpState extends State<register_otp> {
  late String _pin;
  final storage = new FlutterSecureStorage();
  bool _isloading = false;
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
                          _isloading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      color: blue_background),
                                )
                              : SizedBox(height: 20),
                          SizedBox(height: 10),
                          buttongenerator(
                            "Verify",
                            context,
                            () async {
                              if (_full_Otp == null) {
                                setState(() {
                                  _full_Otp = false;
                                  _error_line = "Enter Full OTP";
                                });
                              }
                              if (_full_Otp == true) {
                                setState(() {
                                  _isloading = true;
                                });
                                final response =
                                    await otp_correct(widget.email, _pin);
                                setState(() {
                                  _isloading = false;
                                });

                                if (response['success']) {
                                  await storage.write(
                                      key: 'access_token',
                                      value: response['accesstoken']);

                                  await storage.write(
                                      key: "token",
                                      value: JwtDecoder.decode(
                                              response['accesstoken'])['id']
                                          .toString());
                                  put_seller_info();
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                      context, '/restrauntregister');
                                } else {
                                  setState(() {
                                    _error_line = response['msg'];
                                  });
                                }
                              }
                            },
                          )
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
