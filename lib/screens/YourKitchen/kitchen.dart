import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodora_seller/screens/desigining.dart';

class Kitchen extends StatefulWidget {
  const Kitchen({super.key});

  @override
  State<Kitchen> createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  bool trayhasfood = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(51, 81, 255, 1),
        centerTitle: true,
        title: Text(
          'Kitchen Tray',
          style: TextStyle(
              fontFamily: 'FoodoraFont',
              fontSize: MediaQuery.of(context).size.width / 10),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          // height: MediaQuery.of(context).size.height*0.7,
          width: double.infinity,
          // color: Colors.white,
          child: trayhasfood
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.88,
                  child: ListView.builder(
                    itemCount: 16,
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) => Container(
                              height: 150,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 110, 110, 110)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 150,
                                    child:
                                        SvgPicture.asset('assets/svg/dish.svg'),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 43, 43, 43),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      // color: Colors.white,
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          textgenerator(
                                              'Shaahi Panner',
                                              18,
                                              'Raleway',
                                              300,
                                              Color.fromARGB(
                                                  255, 255, 236, 236)),
                                          textgenerator(
                                              'It has more panner then any other dish and paste of dry fruit.it is full vegitarian dish.',
                                              12,
                                              'Raleway',
                                              300,
                                              Color.fromARGB(
                                                  255, 255, 236, 236)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              textgenerator(
                                                  '₹ ' + '199',
                                                  25,
                                                  'Raleway',
                                                  300,
                                                  Color.fromARGB(
                                                      255, 255, 236, 236)),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.delete_rounded),
                                                iconSize: 30,
                                                color: Colors.white,
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        // children: [
                        //   textgenerator(
                        //       'Your Kitchen',
                        //       MediaQuery.of(context).size.width / 15,
                        //       'Raleway',
                        //       300,
                        //       Color.fromRGBO(50, 81, 255, 1)),
                        //   Container(
                        //     margin: EdgeInsets.only(left: 20, top: 20),
                        //     child: textgenerator('', 15, 'Raleway', 300, Colors.white),
                        //   ),
                        // ],
                        ),
                  ))
              : Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/adddish');
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
        backgroundColor: Color.fromRGBO(51, 81, 255, 1),
      ),
    );
  }
}
