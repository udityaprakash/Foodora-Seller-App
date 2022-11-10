import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodora_seller/config/api_integration.dart';
import 'package:foodora_seller/screens/desigining.dart';
import 'package:image_picker/image_picker.dart';

class Add_dish extends StatefulWidget {
  const Add_dish({super.key});

  @override
  State<Add_dish> createState() => _Add_dishState();
}

class _Add_dishState extends State<Add_dish> {
  bool imagesheet = true;
  var dishnameerr = '';
  var dishdescerr = '';
  var priceerr = '';
  var imgerr = '';
  bool notsendingdata = true;
  String dishname = '';
  String dishdesc = '';
  String price = '';
  dynamic user_info;
  // TextEditingController _restname = TextEditingController();
  // TextEditingController _mobno = TextEditingController();
  // TextEditingController _address = TextEditingController();
  String btntext = 'Next';
  late XFile im;
  final ImagePicker _picker = ImagePicker();
  String? _imagePath;
  File? _image;
  selectImage() async {
    im = await fromgalaryPath();
    setState(() {
      _image = File(im.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: idgrabber(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          user_info = snapshot.data;

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
                            border: Border.all(
                                color: Color.fromARGB(255, 110, 110, 110),
                                width: 2),
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
                            Container(
                                child: imagesheet
                                    ? Stack(
                                        children: <Widget>[
                                          Container(
                                              height: 250,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 110, 110, 110),
                                                    width: 2),
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        16.0),
                                                color: Color.fromRGBO(
                                                    150, 150, 150, 1.5),
                                              ),
                                              child: _image == null
                                                  ? SvgPicture.asset(
                                                      'assets/svg/dish.svg')
                                                  : CircleAvatar(
                                                      backgroundImage:
                                                          FileImage(_image!))),
                                          Positioned(
                                              bottom: 5,
                                              right: 5,
                                              child: InkWell(
                                                child: const Icon(
                                                  Icons.add_circle_rounded,
                                                  color: Colors.white,
                                                  size: 50,
                                                ),
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: ((builder) {
                                                        return Container(
                                                          color: Colors.black,
                                                          height: 140,
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              Column(children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          10.0),
                                                              child: textgenerator(
                                                                  'Choose from below options',
                                                                  20,
                                                                  'Raleway',
                                                                  700,
                                                                  Colors.white),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    fromcamera();
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .no_photography,
                                                                    size: 40,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed:
                                                                      () async {
                                                                    selectImage();
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .add_photo_alternate,
                                                                    size: 40,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ]),
                                                        );
                                                      }));
                                                },
                                                // onTap: Showbottomsheet(context: context, builder: ((builder) => bottomsheet())),
                                              ))
                                        ],
                                      )
                                    : Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        // color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InputFieldgenerator(
                                                'Dish Name', context,
                                                maxlines: 1,
                                                check: (String dish_name) {
                                              dishname = dish_name;
                                              if (dish_name.length == 0) {
                                                dishnameerr =
                                                    'Dish name cannot be empty';
                                              } else {
                                                dishnameerr = '';
                                                dishname = dish_name;
                                              }
                                            }),
                                            SizedBox(
                                              height: 20,
                                              child: errortextgenerator(
                                                  dishnameerr, 13, 300),
                                            ),
                                            InputFieldgenerator(
                                                'Dish Discription', context,
                                                check: (String dish_name_d) {
                                              dishdesc = dish_name_d;

                                              if (dish_name_d.length == 0) {
                                                dishdescerr =
                                                    'Dish description cannot be empty';
                                              } else if (dish_name_d.length <=
                                                      10 &&
                                                  dish_name_d.length > 0) {
                                                dishdescerr =
                                                    'Write something more';
                                              } else {
                                                dishdescerr = '';
                                                dishdesc = dish_name_d;
                                              }
                                            }),
                                            SizedBox(
                                                height: 20,
                                                child: errortextgenerator(
                                                    dishdescerr, 13, 300)),
                                            InputNumfieldgenerator(
                                                'Price', context, 4,
                                                on_changed_function:
                                                    (String price_inputed) {
                                              price = price_inputed;
                                              if (price == '0' ||
                                                  price == '' ||
                                                  int.parse(price_inputed) ==
                                                      0) {
                                                priceerr = 'Price Required';
                                              } else {
                                                priceerr = '';
                                              }
                                            }),
                                            SizedBox(
                                                height: 20,
                                                child: errortextgenerator(
                                                    priceerr, 13, 300)),
                                          ],
                                        ),
                                      )),
                            errortextgenerator(imgerr, 20, 300),
                            notsendingdata
                                ? ElevatedButton(
                                    onPressed: () async {
                                      if (imagesheet == false) {
                                        if (dishname.isNotEmpty) {
                                          if (dishdesc.length >= 10) {
                                            if (price != '0' &&
                                                price != '' &&
                                                int.parse(price) != 0 &&
                                                _image != null) {
                                              setState(() {
                                                notsendingdata = false;
                                              });
                                              var response = await food_list(
                                                  user_info,
                                                  dishname,
                                                  price,
                                                  dishdesc);
                                              if (response['success']) {
                                                Navigator.pop(context);
                                              }
                                              // food_list(id, dishname, price, dishdesc,)

                                              // Navigator.of(context).pop();
                                            } else {
                                              setState(() {
                                                priceerr = 'Price Required';
                                              });
                                            }
                                          } else {
                                            setState(() {
                                              dishdescerr = 'Describe more';
                                            });
                                          }
                                        } else {
                                          setState(() {
                                            dishnameerr =
                                                'Dish name cannot be empty';
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          if (_image != null) {
                                            imgerr = '';
                                            btntext = 'Add Food';
                                            imagesheet = false;
                                          } else {
                                            setState(() {
                                              imgerr = 'Please select Dish Image';
                                            });
                                          }
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromRGBO(50, 81, 255, 1),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height /
                                                60),
                                        child: Text(
                                          btntext,
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: Colors.white,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w900,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  16),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    color: Color.fromRGBO(50, 81, 255, 1),
                                    width: double.infinity,
                                    child: Center(
                                        child: textgenerator(
                                            'Adding...',
                                            MediaQuery.of(context).size.width /
                                                16,
                                            'Raleway',
                                            200,
                                            Colors.white)),
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
        });
  }
}
