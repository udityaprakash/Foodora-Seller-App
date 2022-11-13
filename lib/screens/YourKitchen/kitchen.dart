import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodora_seller/screens/desigining.dart';

import '../../config/api_links.dart';

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
          child: FutureBuilder(
        future: sellerinfograbber(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final list_food = snapshot.data['sellerDetails']['food_list'];
            if (list_food != []) {
              return Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.88,
                      child: ListView.builder(
                        itemCount: list_food.length,
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
                                    child: Image.network(
                                      backend_link +
                                          list_food[index]['imgpath'],
                                    ),
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
                                              list_food[index]['foodname'],
                                              18,
                                              'Raleway',
                                              300,
                                              Color.fromARGB(
                                                  255, 255, 236, 236)),
                                          textgenerator(
                                              list_food[index]['food_desc'],
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
                                                  '₹ ' +
                                                      list_food[index]
                                                              ['food_price']
                                                          .toString(),
                                                  25,
                                                  'Raleway',
                                                  300,
                                                  Color.fromARGB(
                                                      255, 255, 236, 236)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      )));
            } else {
              return Text("Food Items Not Added");
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
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











//
