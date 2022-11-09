import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodora_seller/config/api_integration.dart';
import 'package:foodora_seller/screens/desigining.dart';
import 'package:http/http.dart';
import 'package:textfield_datepicker/textfield_timePicker.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 40.0,
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
                  height: MediaQuery.of(context).size.height / 20,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    log(restname);
                    log(mobno);
                    log(addres);
                    log(_timeo.text.toString());
                    log(_timec.text.toString());
                    final id = await storage.read(key: 'token');

                    log(id.toString());
                    setState(() {
                      _isloading = true;
                    });
                    final response = await restaurant_register(
                        id!, restname, mobno, addres, _timeo.text, _timec.text);
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
                    ;
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
