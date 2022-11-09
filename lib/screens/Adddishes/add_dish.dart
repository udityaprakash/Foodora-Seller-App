import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';

class Add_dish extends StatefulWidget {
  const Add_dish({super.key});

  @override
  State<Add_dish> createState() => _Add_dishState();
}

class _Add_dishState extends State<Add_dish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height - 40.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Toppageicon(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: textgenerator(
                          'Foodora',
                          MediaQuery.of(context).size.width / 8,
                          'FoodoraFont',
                          700,
                          Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width / 48),
                      child: textgenerator(
                          'for bussiness',
                          MediaQuery.of(context).size.width / 15,
                          'FoodoraFont',
                          400,
                          Colors.white),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 80),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 60, 60, 60)),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50))
                      // all(Radius.circular(20.0)),
                      ),
                  height: MediaQuery.of(context).size.height / 1.75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 15,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50))),
                        child: Center(
                          child: textgenerator(
                              'Add Your Dish',
                              MediaQuery.of(context).size.width / 14,
                              'Raleway',
                              800,
                              Colors.white),
                        ),
                      ),

                      

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(50, 81, 255, 1),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height / 60),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  letterSpacing: 2,
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                  fontSize:
                                      MediaQuery.of(context).size.width / 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
