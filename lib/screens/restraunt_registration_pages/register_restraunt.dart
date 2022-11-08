import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodora_seller/screens/desigining.dart';
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
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height - 40.0,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              // shrinkWrap: true,
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
                Center(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(16.0),
                          color: Color.fromRGBO(150, 150, 150, 1.5),
                        ),
                        child: SvgPicture.asset(
                            'assets/svg/restrauntdefaultimg.svg'),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 5,
                          child: InkWell(
                            child: const Icon(
                              Icons.add_circle_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) =>
                                      Showbottomsheet()));
                            },
                            // onTap: Showbottomsheet(context: context, builder: ((builder) => bottomsheet())),
                          ))


                    ],
                  ),
                ),
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
                // InputFieldgenerator(
                //   "Restraunt Description", context, controller: _restdec,
                //   // functi: (value) {
                //   //   if (value == null || value.isEmpty) {
                //   //     return 'Please enter some text';
                //   //   }
                //   //   return null;
                //   // }
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height / 35,
                //   child: errortextgenerator(resdescerr, 10, 400),
                // ),
                InputNumfieldgenerator('Mobile No.', context, 10,
                    on_changed_function: (String textinput) {
                  if (textinput.isNotEmpty) {
                    if (textinput.length < 10) {
                      mobnoerr = '10 digits required';
                    } else {
                      mobno = textinput;
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
                Inputtimepicker(context, 'Opening Time', _timeo),
                Inputtimepicker(context, 'Closing Time', _timec),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                buttongenerator('Next', context, () {
                  if (mobno.length == 10 && (addres != '' && restname != '')) {
                    Navigator.pushReplacementNamed(context, '/main_home');
                  } else {}
                  setState(() {
                    // if (_restname.text == '') {
                    //   resnameerr = 'Restraunt name cannot be empty';
                    // } else {}
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
