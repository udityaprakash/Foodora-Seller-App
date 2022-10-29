import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.only(top:30.0,left: 20.0,right: 20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Foodora',
              style: TextStyle(
                fontFamily: 'FoodoraFont',
                fontSize: 55.0,
              ),
                ),
                
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('for bussiness',              
                style: TextStyle(
                  fontFamily: 'FoodoraFont',
                  fontSize: 25.0,
                ),
                ),
              ),
            ],
            
          )
        ],
      ),
    ));
  }
}