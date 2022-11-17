import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodora_seller/config/api_integration.dart';
import 'package:foodora_seller/screens/desigining.dart';
import 'package:image_picker/image_picker.dart';

class Editrestraunt extends StatefulWidget {
  const Editrestraunt({super.key});

  @override
  State<Editrestraunt> createState() => _EditrestrauntState();
}

class _EditrestrauntState extends State<Editrestraunt> {
  var resnameerr = '';
  var mobnoerr = '';
  var adderr = '';
  var pinerr = '';
  String? restname;
  String? mobno;
  String? addres;
  String? pinno;
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
    _image = [];
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
                        height: MediaQuery.of(context).size.height * 0.22,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _image.length,
                            itemBuilder: (BuildContext context, int index) {
                              //design this
                              return Container(
                                width: 250,
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 110, 110, 110),
                                        width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Image.file(_image[index],),
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
                      selectImage();
                      // showModalBottomSheet(
                      //   context: context,
                      //   builder: ((builder) {
                      //     return Container(
                      //       color: Colors.black,
                      //       height: 140,
                      //       width: double.infinity,
                      //       child: Column(
                      //         children: [
                      //           Padding(
                      //             padding: const EdgeInsets.only(top: 10.0),
                      //             child: textgenerator(
                      //                 'Choose from below options',
                      //                 20,
                      //                 'Raleway',
                      //                 700,
                      //                 Colors.white),
                      //           ),
                      //           SizedBox(
                      //             height: 10,
                      //           ),
                      //           Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceAround,
                      //             children: [
                      //               IconButton(
                      //                 onPressed: () async {
                      //                   fromcamera();
                      //                 },
                      //                 icon: const Icon(
                      //                   Icons.no_photography,
                      //                   size: 40,
                      //                   color: Colors.white,
                      //                 ),
                      //               ),
                      //               IconButton(
                      //                 onPressed: () async {
                      //                   selectImage();
                      //                 },
                      //                 icon: const Icon(
                      //                   Icons.add_photo_alternate,
                      //                   size: 40,
                      //                   color: Colors.white,
                      //                 ),
                      //               ),
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //   }),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(50, 81, 255, 1),
                    ),
                    child: textgenerator(
                        'Add Pics', 18, 'Raleway', 400, Colors.white)),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                InputFieldgenerator("Restraunt Name", context,
                    check: (String Rest_name) {
                  restname = Rest_name;
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
                      setState(() {
                        mobnoerr = '10 digits required';
                      });
                    } else {
                      if (ismobilenumber(mobno!)) {
                        setState(() {
                          mobnoerr = '';
                        });
                      } else {
                        mobnoerr = 'Invalid Mobile no';
                      }
                    }
                  } else {
                    setState(() {
                      mobnoerr = '';
                    });
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                  child: errortextgenerator(
                      mobnoerr, MediaQuery.of(context).size.width / 30, 400),
                ),
                InputNumfieldgenerator('Pincode', context, 6,
                    on_changed_function: (String pin) {
                  pinno = pin;
                  if (!ispin(pinno!)) {
                    pinerr = 'Invalid pin';
                  } else {
                    pinerr = '';
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                  child: errortextgenerator(
                      pinerr, MediaQuery.of(context).size.width / 30, 400),
                ),
                InputFieldgenerator("Full Address", context,
                    check: (String addr) {
                  addres = addr;
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
                _image.length != 5
                    ? SizedBox(
                        height: 20,
                        child: errortextgenerator('5 Images required', 15, 300),
                      )
                    : SizedBox(height: 20),
                _isloading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child:
                            CircularProgressIndicator(color: blue_background),
                      )
                    : SizedBox(height: 20),
                _isloading
                    ? Container()
                    : buttongenerator(
                        'Next',
                        context,
                        () async {
                          if (!_isloading) {
                            if ((mobno == null ||
                                        (mobno.toString().length == 0)
                                    ? ismobilenumber(mobno!)
                                    : false) &&
                                (pinno == null ||
                                    pinno.toString().length == 6) &&
                                (_image.isEmpty || _image.length == 5) && 
                                (pinno == null || (pinno.toString().length < 0)
                                ? ispin(pinno!)
                                :false
                                )) {
                              final id = await storage.read(key: 'token');

                              setState(() {
                                _isloading = true;
                              });

                              final response = await restaurant_modify(
                                  id!,
                                  restname,
                                  mobno,
                                  addres,
                                  pinno,
                                  _timeo.text,
                                  _timec.text,
                                  _image);
                              setState(() {
                                _isloading = false;
                              });
                              if (response['success']) {
                                Navigator.pushReplacementNamed(
                                    context, '/main_home');
                              } else {
                                setState(() {
                                  adderr = response['msg'];
                                });
                              }
                            } else {}
                            setState(() {});
                          }
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
