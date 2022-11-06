import 'package:flutter/material.dart';

import '../desigining.dart';

class EnterOTP extends StatefulWidget {
  final String email;
  const EnterOTP({super.key,
   required this.email
   });

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.email)),
    );
  }
}
