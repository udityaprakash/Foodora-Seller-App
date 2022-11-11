import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final String Helpw = 'For Quick Support Please contact our team';
  final String details = 'Vaidic - 9567356754';
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
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textgenerator(
                  'Help',
                  MediaQuery.of(context).size.width / 15,
                  'Raleway',
                  300,
                  Color.fromRGBO(50, 81, 255, 1)),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Column(children: [

                textgenerator(Helpw, 15, 'Raleway', 300, Colors.white),
                SizedBox(height: 10),
                textgenerator(details, 15, 'Raleway', 300, Colors.white),
                SizedBox(height: 10),
                textgenerator('Uditya - 9987664556', 15, 'Raleway', 300, Colors.white),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
