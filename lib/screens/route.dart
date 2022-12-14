import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/Adddishes/add_dish.dart';
import 'package:foodora_seller/screens/YourKitchen/kitchen.dart';
import 'package:foodora_seller/screens/editrestraunt.dart';
import 'package:foodora_seller/screens/forgotpages/resetpages.dart';
import 'package:foodora_seller/screens/help.dart';
import 'package:foodora_seller/screens/homepage/loginpage.dart';
import 'package:foodora_seller/screens/main_home_pages/home_page_redirector.dart';
import 'package:foodora_seller/screens/main_home_pages/main_home.dart';
import 'package:foodora_seller/screens/newregister/registerotppage.dart';
import 'package:foodora_seller/screens/restraunt_registration_pages/register_restraunt.dart';
import 'package:foodora_seller/screens/splashpage/splash_screen.dart';
import 'package:foodora_seller/screens/termsnpolicy.dart';

import 'forgotpages/forgotpass.dart';
import 'forgotpages/otppage.dart';
import 'homepage/homepage.dart';
import 'homepage/newsellerpage.dart';
import 'newregister/register.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/homepage':
        return MaterialPageRoute(builder: (_) => const Homepage());
      case '/splashspage':
        return MaterialPageRoute(builder: (_) => const Splashscreen());
      case '/siginpage':
        return MaterialPageRoute(builder: (_) => const Loginpage());
      // case '/newrestaraunt':
      //   return MaterialPageRoute(builder: (_) => const Newsellerpage());
      case '/newregister':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/register_otp':
        return MaterialPageRoute(
            builder: (_) => register_otp(email: args.toString()));
      case '/forgotpass':
        return MaterialPageRoute(builder: (_) => const Forgotpassword());
      case '/otppage':
        return MaterialPageRoute(
            builder: (_) => EnterOTP(email: args.toString()));
      case '/resetpassword':
        return MaterialPageRoute(
            builder: (_) => Resetpassword(
                  email: args.toString(),
                ));
      case '/restrauntregister':
        return MaterialPageRoute(builder: (_) => Restraunt_register());
      case '/help': 
      return MaterialPageRoute(builder: (_) => const Help()); 
      case '/kitchen': 
      return MaterialPageRoute(builder: (_) => const Kitchen()); 
      case '/main_home':
        return MaterialPageRoute(builder: (_) => const main_home());
      case '/home_page_redirector':
        return MaterialPageRoute(builder: (_) => const home_page_redirector());
      case '/terms':
        return MaterialPageRoute(builder: (_) => const Termsnpolicy());  
      case '/adddish':  
        return MaterialPageRoute(builder: (_) => const Add_dish());
      case '/editrestraunt':
        return MaterialPageRoute(builder: (_) => const Editrestraunt());  
      default:
        return null;

    }
  }
}

class Errorpage extends StatelessWidget {
  const Errorpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
