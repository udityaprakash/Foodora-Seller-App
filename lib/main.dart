import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/homepage/homepage.dart';
import 'package:foodora_seller/screens/homepage/loginpage.dart';
import 'package:foodora_seller/screens/homepage/newsellerpage.dart';
import 'package:foodora_seller/screens/newregister/register.dart';
import 'package:foodora_seller/screens/route.dart';

import 'screens/forgotpages/forgotpass.dart';
import 'screens/forgotpages/otppage.dart';
import 'screens/splashpage/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/homepage': (_) => const Homepage(),
      //   '/siginpage': (_) => const Loginpage(),
      //   '/newrestaraunt': (_) => const Newsellerpage(),
      //   '/newregister': (_) => const Register(),
      //   '/forgotpass': (_) => const Forgotpassword(),
      //   '/otppage': (_) => const EnterOTP(email: 'userentered'),
      // },
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        textTheme: Typography().white,
      ),
      // home: const Scaffold(
      //   body: Splashscreen(),
      // ),
    );
  }
}
