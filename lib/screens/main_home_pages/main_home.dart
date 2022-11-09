import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodora_seller/screens/desigining.dart';

class main_home extends StatefulWidget {
  const main_home({super.key});

  @override
  State<main_home> createState() => _main_homeState();
}

class _main_homeState extends State<main_home> {
  final storage = new FlutterSecureStorage();
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
        // leading: IconButton(
        //   icon: IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {},
        //   ),
        //   onPressed: () {},
        // ),
      ),
      body:SingleChildScrollView(
         ) ,
      drawer: Drawer(
        backgroundColor: Color.fromARGB(238,238,238,250),
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                color: Color.fromRGBO(70, 73, 255, 1),
                width: double.infinity,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textgenerator('Welcome,', 25, 'Raleway', 300, Colors.white),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,left: 20),
                      child: textgenerator(
                          'Uditya', 20, 'Raleway', 300, Colors.white),
                    ),
                  ],
                )),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.policy,
                color: Colors.black,
              ),
              title: textgenerator('Terms And Policy', 15, 'Raleway', 500, Colors.white),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.black,
              ),
              title: textgenerator('Help', 15, 'Raleway', 500, Colors.white),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: textgenerator('Log Out', 15, 'Raleway', 500, Colors.white),
              onTap: () async {
                storage.delete(key: 'token');
                Navigator.pushReplacementNamed(context, '/home_page_redirector');
                log("Signing Out");
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
