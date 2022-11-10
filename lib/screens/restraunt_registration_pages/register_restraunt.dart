import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodora_seller/config/api_integration.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodora_seller/screens/desigining.dart';
import 'package:http/http.dart';
import 'package:textfield_datepicker/textfield_timePicker.dart';
import 'package:image_picker/image_picker.dart';

class Restraunt_register extends StatefulWidget {
  Restraunt_register({super.key});

  @override
  State<Restraunt_register> createState() => _Restraunt_registerState();
}

class _Restraunt_registerState extends State<Restraunt_register> {
  var resnameerr = '';
  var mobnoerr = '';
  var adderr = '';
  late String restname;
  late String mobno;
  late String addres;
  TextEditingController _restname = TextEditingController();
  TextEditingController _mobno = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _timeo = TextEditingController();
  TextEditingController _timec = TextEditingController();
  bool _isloading = false;
  final storage = new FlutterSecureStorage();
  final ImagePicker _picker = ImagePicker();
  List<File> _image = [];
  selectImage() async {
    log("from res");
    List<XFile> _ximage = await fromgalarymultiplePath();
    for (int i = 0; i < _ximage.length; ++i) {
      _image.add(File(_ximage[i].path));
    }
    setState(
      () {},
    );
  }

  imageFun() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Toppageicon(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    textgenerator(
                        'Foodora',
                        MediaQuery.of(context).size.width / 8,
                        'FoodoraFont',
                        700,
                        Colors.white),
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
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                textgenerator(
                    'RESTRAUNT INFORMATION',
                    MediaQuery.of(context).size.width / 20,
                    'Raleway',
                    700,
                    Colors.white),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                _image.isNotEmpty
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _image.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Image.file(_image[index]),
                              );
                            }),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height / 5.1,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(16.0),
                          color: Color.fromRGBO(150, 150, 150, 1.5),
                        ),
                        child: SvgPicture.asset(
                            'assets/svg/restrauntdefaultimg.svg'),
                      ),
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) {
                          return Container(
                            color: Colors.black,
                            height: 140,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
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
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        fromcamera();
                                      },
                                      icon: const Icon(
                                        Icons.no_photography,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        selectImage();
                                      },
                                      icon: const Icon(
                                        Icons.add_photo_alternate,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                      );
                    },
                    child: Text("Add Pics")),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                InputFieldgenerator("Restraunt Name", context,
                    check: (String Rest_name) {
                  restname = Rest_name;
                  if (Rest_name.length == 0) {
                    resnameerr = 'Restraunt name cannot be empty';
                  } else {
                    resnameerr = '';
                    restname = Rest_name;
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                  child: errortextgenerator(
                      resnameerr, MediaQuery.of(context).size.width / 30, 400),
                ),
                InputNumfieldgenerator('Mobile No.', context, 10,
                    on_changed_function: (String textinput) {
                  mobno = textinput;

                  if (textinput.isNotEmpty) {
                    if (textinput.length != 10) {
                      mobnoerr = '10 digits required';
                    } else {
                      mobnoerr = '';
                    }
                  } else {
                    mobnoerr = 'Mobile no is required';
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                  child: errortextgenerator(
                      mobnoerr, MediaQuery.of(context).size.width / 30, 400),
                ),
                InputFieldgenerator("Full Address", context,
                    check: (String addr) {
                  if (addr.isEmpty) {
                    adderr = 'Address cannot be empty';
                  } else {
                    adderr = '';
                    addres = addr;
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 55,
                  child: errortextgenerator(
                      adderr, MediaQuery.of(context).size.width / 30, 400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Inputtimepicker(context, 'Opening Time', _timeo),
                    Inputtimepicker(context, 'Closing Time', _timec),
                  ],
                ),
                _isloading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            CircularProgressIndicator(color: blue_background),
                      )
                    : SizedBox(height: 20),
                buttongenerator('Next', context, () async {
                  if (mobno.length == 10 &&
                      (addres != '' &&
                          restname != '' &&
                          mobno != '' &&
                          addres != null &&
                          restname != null)) {
                    final id = await storage.read(key: 'token');

                    setState(() {
                      _isloading = true;
                    });
                    log("abovefunction" + _image.toString());
                    final response = await restaurant_register(id!, restname,
                        mobno, addres, _timeo.text, _timec.text, _image);
                    setState(() {
                      _isloading = false;
                    });
                    if (response['success']) {
                      Navigator.pushReplacementNamed(context, '/main_home');
                    } else {
                      setState(() {
                        adderr = response['msg'];
                      });
                    }
                  } else {}
                  setState(() {});
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}