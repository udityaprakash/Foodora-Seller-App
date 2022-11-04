import 'package:flutter/material.dart';

import '../desigining.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child:
              textgenerator('Forgot Password', 20, 'Raleway', 500, Colors.blue),
        ),
      ),
    );
    ;
  }
}
