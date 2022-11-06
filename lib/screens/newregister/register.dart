import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _passwordVisible = true;
  bool _repassword = true;
  String emailmess = "";
  String passmess = "";
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    _repassword = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 40,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
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
                    InputFieldgenerator('Full Name', context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    InputFieldgenerator('Email  Address', context),
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
                    }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 35,
                    ),
                    Inputpassfield('Re enter Password', _repassword, context,
                        () {
                      setState(() {
                        _repassword = !_repassword;
                      });
                    }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: errortextgenerator(passmess,
                              MediaQuery.of(context).size.width / 25, 300)),
                    ),
                    buttongenerator('Continue', context, () {
                      setState(() {
                        emailmess = "Invalid Email";
                        passmess = "Password do not match";
                        
                      });
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textgenerator(
                            'Already Registered?',
                            MediaQuery.of(context).size.width / 15,
                            'Raleway',
                            400,
                            Colors.white),
                        Textlink(
                            'Login',
                            MediaQuery.of(context).size.width / 15,
                            context,
                            800,
                            const Color.fromRGBO(50, 81, 255, 1), () {
                          Navigator.pushReplacementNamed(context, '/siginpage');
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
