import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodora_seller/config/api_integration.dart';
import '../desigining.dart';

class Resetpassword extends StatefulWidget {
  final String email;
  const Resetpassword({super.key, required this.email});

  @override
  State<Resetpassword> createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  bool _passwordVisible = true;
  bool _repassword = true;
  String passmess = "";
  TextEditingController _passController = new TextEditingController();
  TextEditingController _repassController = new TextEditingController();
  bool _isloading = false;

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
                                MediaQuery.of(context).size.height / 3,
                                MediaQuery.of(context).size.width / 0.7,
                                'assets/svg/Reenterpasspageicon.svg'),
                          ),
                          textgenerator(
                            'RESET PASSWORD',
                            MediaQuery.of(context).size.width / 13,
                            'Raleway',
                            700,
                            Colors.white,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Inputpassfield('Password', _passwordVisible, context,
                              () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          }, controller: _passController),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 30,
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child:
                                      errortextgenerator(passmess, 15, 400))),
                          Inputpassfield(
                              'Re enter Password', _repassword, context, () {
                            setState(() {
                              _repassword = !_repassword;
                            });
                          }, controller: _repassController),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          _isloading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      color: blue_background),
                                )
                              : SizedBox(height: 20),
                          _isloading?Container():buttongenerator(
                            'Set Password',
                            context,
                            () async {
                              log(widget.email);
                              if (isStrong(_passController.text)) {
                                passmess = '';
                                if (_passController.text ==
                                    _repassController.text) {
                                  passmess = "";
                                  setState(() {
                                    _isloading = true;
                                  });
                                  final response = await forget_new_password(
                                      widget.email, _passController.text);
                                  setState(() {
                                    _isloading = false;
                                  });
                                  if (response['success']) {
                                    Navigator.pushReplacementNamed(
                                        context, '/homepage');
                                  } else {
                                    setState(() {
                                      passmess = response['msg'];
                                    });
                                  }
                                } else {
                                  passmess = 'Password do not match';
                                }
                              } else {
                                passmess = 'Weak Password';
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
