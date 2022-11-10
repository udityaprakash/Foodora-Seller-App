import 'package:flutter/material.dart';

class Termsnpolicy extends StatelessWidget {
  const Termsnpolicy({super.key});

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
          height: MediaQuery.of(context).size.height*0.7,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}