import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({super.key});

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
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

              textgenerator('Your Kitchen', MediaQuery.of(context).size.width/15, 'Raleway', 300, Color.fromRGBO(50, 81, 255, 1)),
              Container(
                margin: EdgeInsets.only(left:20,top: 20),
                child: textgenerator('', 15, 'Raleway', 300, Colors.white),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}