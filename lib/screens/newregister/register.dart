import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: textgenerator('New Register', 20, 'Raleway', 500, Colors.blue),
        ),
      ),
    );
  }
}
