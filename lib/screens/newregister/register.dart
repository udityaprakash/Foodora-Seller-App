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
        child: Stack(
          children:[ 
            Backgroundimg(context),
            SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Center(
                    child: textgenerator(
                        'Welcome', 30, 'Raleway', 700, Colors.blue),
                  ),
                ],
              ),
            ),
          ),
          ]
        ),
      ),
    );
  }
}
