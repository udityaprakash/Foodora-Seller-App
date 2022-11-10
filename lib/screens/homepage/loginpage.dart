import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodora_seller/screens/desigining.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../config/api_integration.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  var emailmessage = '';
  var passwordmessage = '';
  bool _passwordVisible = true;
  bool _isloading = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Bottomgradient(context),
                Backgroundimg(context),
                Column(
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
                                'assets/svg/Fingerprint.svg'),
                          ),
                          InputFieldgenerator('Enter Your Email', context,
                              controller: _emailController),
                          SizedBox(
                            height: 25.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                errortextgenerator(
                                  emailmessage,
                                  15,
                                  300,
                                ),
                              ],
                            ),
                          ),
                          Inputpassfield('Password', _passwordVisible, context,
                              () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          }, controller: _passController),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              errortextgenerator(passwordmessage, 15, 400),
                              Textlink('Forgot Password', 15, context, 300,
                                  Colors.white, () {
                                Navigator.pushNamed(context, '/forgotpass');
                              }),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                            child: _isloading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: blue_background))
                                : SizedBox(height: 1),
                          ),
                          SizedBox(height: 10),
                          buttongenerator('Sign In', context, () async {
                            {
                              if (isEmail(_emailController.text)) {
                                setState(() {
                                  emailmessage = '';
                                  _isloading = true;
                                });
                                final response = await sign_in(
                                    _emailController.text,
                                    _passController.text);
                                setState(() {
                                  _isloading = false;
                                });
                                if (response['success']) {
                                  setState(() {
                                    _isloading = true;
                                  });
                                  await storage.write(
                                      key: "access_token",
                                      value: response['accesstoken']);
                                  await storage.write(
                                      key: "token",
                                      value: JwtDecoder.decode(
                                              response['accesstoken'])['id']
                                          .toString());
                                  put_seller_info();
                                  setState(() {
                                    _isloading = false;
                                  });
                                  Navigator.pushReplacementNamed(
                                      context, '/main_home');
                                } else if (response['msg'] ==
                                    "User Not Verified") {
                                  send_api_otp(_emailController.text);
                                  Navigator.pushReplacementNamed(
                                      context, '/otppage',
                                      arguments: _emailController.text);
                                } else {
                                  emailmessage = response['msg'];
                                }
                              } else {
                                setState(() {});
                                emailmessage = 'Invalid Email';
                              }
                            }
                            ;
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textgenerator('New user?', 25, 'Raleway', 400,
                                  Colors.white),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
