import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodora_seller/screens/desigining.dart';

import '../../config/api_integration.dart';

class main_home extends StatefulWidget {
  const main_home({super.key});

  @override
  State<main_home> createState() => _main_homeState();
}

class _main_homeState extends State<main_home> {
  bool _isloading = false;
  final storage = new FlutterSecureStorage();
  bool orderexist = true;
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
          actions: [
            IconButton(
              icon: const Icon(Icons.sync),
              iconSize: 30,
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
        // ),
        body: FutureBuilder(
          future: sellerinfograbber(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var order_info = snapshot.data['sellerDetails']['orders'];

              if (order_info == null) {
                return Container(
                  child: textgenerator(
                      'No Order yet', 15, 'Raleway', 500, Colors.white),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.white38,
                        margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.85,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 110, 110, 110),
                                width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  textgenerator(
                                      'Your Orders',
                                      MediaQuery.of(context).size.width / 15,
                                      'RaleWay',
                                      200,
                                      Colors.white),
                                  Divider(
                                    color: Colors.white38,
                                  ),
                                ],
                              ),
                            ),
                            orderexist
                                ? Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    child: ListView.builder(
                                        itemCount: order_info.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: ((context, index) =>
                                            Container(
                                              height: 320,
                                              width: double.infinity,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 110, 110, 110)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        textgenerator(
                                                            "User " +
                                                                (index + 1)
                                                                    .toString(),
                                                            20,
                                                            'Raleway',
                                                            500,
                                                            Color.fromRGBO(50,
                                                                81, 255, 1)),
                                                        Divider(
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Container(
                                                            height: 130,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          110,
                                                                          110,
                                                                          110)),
                                                              // borderRadius: BorderRadius.all(Radius.circular(20))
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    textgenerator(
                                                                        'Food',
                                                                        20,
                                                                        'Raleway',
                                                                        500,
                                                                        Colors
                                                                            .white),
                                                                    Divider(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            255)),
                                                                    textgenerator(
                                                                        'Quantity',
                                                                        20,
                                                                        'Raleway',
                                                                        500,
                                                                        Colors
                                                                            .white),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 80,
                                                                  child: ListView
                                                                      .builder(
                                                                    itemCount: order_info[
                                                                            index]
                                                                        .length,
                                                                    itemBuilder:
                                                                        ((context,
                                                                                food_index) =>
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                border: Border.all(color: Color.fromARGB(255, 110, 110, 110)),
                                                                                // borderRadius: BorderRadius.all(Radius.circular(20))
                                                                              ),
                                                                              child: Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                    children: [
                                                                                      textgenerator(order_info[index][food_index]['foodname'], 18, 'Raleway', 500, Colors.white),
                                                                                      textgenerator(order_info[index][food_index]['quantity'].toString(), 18, 'Raleway', 500, Colors.white),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            )),
                                                                  ),
                                                                ),
                                                              ],
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Acceptbtn(context,
                                                          onpressed: () async {
                                                        if (!_isloading) {
                                                          _isloading = true;
                                                          await order_done(
                                                              index);
                                                          _isloading = false;
                                                          setState(() {});
                                                        }
                                                      }),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ))),
                                  )
                                : Container(
                                    child: textgenerator('No Order yet', 15,
                                        'Raleway', 500, Colors.white),
                                  ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        drawer: FutureBuilder(
          future: sellerinfograbber(),
          builder: (context, snapshot) {
            final seller_info = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return Drawer(
                backgroundColor: Color.fromARGB(255, 203, 203, 255),
                child: Column(
                  children: [
                    DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Container(
                        color: Color.fromRGBO(50, 73, 255, 1),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  textgenerator('Welcome,', 25, 'Raleway', 300,
                                      Colors.white),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 40),
                                    child: textgenerator(
                                        seller_info['sellerDetails']
                                            ['username'],
                                        20,
                                        'Raleway',
                                        300,
                                        Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 20),
                              child: textgenerator(
                                  seller_info['sellerDetails']['email'],
                                  12,
                                  'Raleway',
                                  300,
                                  Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.loupe,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: textgenerator(
                          'Add Dishes', 15, 'Raleway', 500, Colors.white),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/adddish');
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: textgenerator(
                          'Edit Restraunt', 15, 'Raleway', 500, Colors.white),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/editrestraunt');
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.restaurant_menu,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: textgenerator(
                          'Your Kitchen', 15, 'Raleway', 500, Colors.white),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/kitchen');
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.policy,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: textgenerator(
                          'Terms And Policy', 15, 'Raleway', 500, Colors.white),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/terms');
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.help,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: textgenerator(
                          'Help', 15, 'Raleway', 500, Colors.white),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/help');
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.black,
                      ),
                      title: textgenerator(
                          'Log Out', 15, 'Raleway', 500, Colors.white),
                      onTap: () async {
                        storage.deleteAll();

                        Navigator.pushReplacementNamed(
                            context, '/home_page_redirector');
                        log("Signing Out");
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(
                    color: blue_background,
                  ),
                ),
              );
            }
          },
        ));
  }
}
