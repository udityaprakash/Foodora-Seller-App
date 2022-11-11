import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';

class Termsnpolicy extends StatelessWidget {
  const Termsnpolicy({super.key});
  final String terms='Subject to the terms of this License Agreement, Foodora hereby grants you a non-transferable, non-exclusive, revocable, non-sublicensable, royalty-free license to use, reproduce and display Foodora name, trademarks, service marks and logos identified as set out in the License Content Usage Guidelines (collectively, “Marks”), solely for purposes of performing your obligations or exercising your rights under this License Agreement and strictly in accordance with the License Content Usage Guidelines. Your data controller is responsible for the collection, use, disclosure, retention, and protection of your personal information in accordance with its privacy standards as well as any applicable national laws. Your data controller may transfer data to other members of Foodora as described in this Privacy Policy. Foodora may process and retain your personal information on its servers in India where its data centers are located, and/or on the servers of its third parties (in or outside India), having contractual relationships with Foodora.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 81, 255, 1),
        centerTitle: true,
        title: Text(
          'Foodora',
          style: TextStyle(
              fontFamily: 'FoodoraFont',
              fontSize: MediaQuery.of(context).size.width / 10),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          // height: MediaQuery.of(context).size.height*0.7,
          width: double.infinity,
          // color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              textgenerator('Terms and Conditions', MediaQuery.of(context).size.width/15, 'Raleway', 300, Color.fromRGBO(50, 81, 255, 1)),
              Container(
                margin: EdgeInsets.only(left:20,top: 20),
                child: textgenerator(terms, 15, 'Raleway', 300, Colors.white),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}