import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodora_seller/screens/desigining.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height ,
      padding: EdgeInsets.fromLTRB(10,30.0,10,10),
      child: Column(       
        children: [
          svggenerator(250,250,
                  'assets/svg/loginpageicon.svg',
                ),
        ],
      ),
    )
    );
  }
}