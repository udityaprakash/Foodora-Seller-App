import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodora_seller/screens/homepage/newsellerpage.dart';
import 'loginpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Foodora',
                      style: TextStyle(
                        fontFamily: 'FoodoraFont',
                        fontSize: 55.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'for bussiness',
                        style: TextStyle(
                          fontFamily: 'FoodoraFont',
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60.0,
                ),
                SvgPicture.asset(
                  'assets/svg/logo.svg',
                  width: 350,
                  height: 350,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    shape: const StadiumBorder(),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Login'.toUpperCase(),
                        style: const TextStyle(
                            letterSpacing: 4,
                            color: Color.fromRGBO(0, 0, 255, 1),
                            fontFamily: 'Raleway',
                            fontVariations: <FontVariation>[FontVariation('wght',600)],
                            fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Newsellerpage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    shape: const StadiumBorder(),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'New Seller'.toUpperCase(),
                        style: const TextStyle(
                            letterSpacing: 4,
                            color: Color.fromRGBO(0, 0, 255, 1),
                            fontFamily: 'Raleway',
                            // fontWeight: FontWeight.w900,
                            fontVariations: <FontVariation>[FontVariation('wght',600)],
                            fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("Code Of Conduct",
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                        Text("Terms Of Service",
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                        Text("Privacy Policy",
                            style:
                                TextStyle(decoration: TextDecoration.underline))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
