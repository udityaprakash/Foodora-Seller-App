import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';

import '../../config/api_integration.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isloading = false;
  bool _passwordVisible = true;
  bool _repassword = true;
  String emailmess = "";
  String passmess = "";
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _repassController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 35,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Bottomgradient(context),
                Backgroundimg(context),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 18),
                  child: Column(
                    children: [
                      Toppageicon(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 20),
                        child: Center(
                          child: textgenerator(
                              'WELCOME TO FOODORA',
                              MediaQuery.of(context).size.width / 15,
                              'Raleway',
                              700,
                              Colors.white),
                        ),
                      ),
                      InputFieldgenerator('Full Name', context,
                          controller: _nameController),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      InputFieldgenerator('Email  Address', context,
                          controller: _emailController),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: errortextgenerator(emailmess,
                                MediaQuery.of(context).size.width / 25, 300)),
                      ),
                      Inputpassfield('Password', _passwordVisible, context, () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }, controller: _passController),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      Inputpassfield('Re enter Password', _repassword, context,
                          () {
                        setState(() {
                          _repassword = !_repassword;
                        });
                      }, controller: _repassController),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 30,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: errortextgenerator(passmess,
                                MediaQuery.of(context).size.width / 25, 300)),
                      ),
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
                            emailmess = "";
                            if (isStrong(_passController.text)) {
                              if (_passController.text ==
                                  _repassController.text) {
                                passmess = '';
                                setState(() {
                                  _isloading = true;
                                });
                                dynamic response = await sign_up(
                                    _nameController.text,
                                    _emailController.text,
                                    _passController.text);
                                setState(() {
                                  _isloading = false;
                                });
                                if (response['success']) {
                                  Navigator.pushNamed(
                                      context, '/register_otp',
                                      arguments: _emailController.text);
                                } else {
                                  emailmess = response['msg'];
                                }
                              } else {
                                passmess = 'Password do not match';
                              }
                            } else {
                              passmess = "Weak Password";
                            }
                          } else {
                            emailmess = "Invalid Email";
                          }
                          setState(() {});
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textgenerator(
                              'Already Registered?',
                              MediaQuery.of(context).size.width / 17,
                              'Raleway',
                              400,
                              Colors.white),
                          Textlink(
                            'Login',
                            MediaQuery.of(context).size.width / 17,
                            context,
                            800,
                            const Color.fromRGBO(50, 81, 255, 1),
                            () {
                              Navigator.pushReplacementNamed(
                                  context, '/siginpage');
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
