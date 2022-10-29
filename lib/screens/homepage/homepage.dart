import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'loginpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  MaterialPageRoute(builder: (context) => const Loginpage()),
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
                        fontWeight: FontWeight.w900,
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
                  MaterialPageRoute(builder: (context) => const Loginpage()),
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
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
