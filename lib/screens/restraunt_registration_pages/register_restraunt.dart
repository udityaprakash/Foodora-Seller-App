import 'package:flutter/material.dart';
import 'package:foodora_seller/screens/desigining.dart';
import 'package:textfield_datepicker/textfield_timePicker.dart';

class Restraunt_register extends StatefulWidget {
  Restraunt_register({super.key});

  @override
  State<Restraunt_register> createState() => _Restraunt_registerState();
}

class _Restraunt_registerState extends State<Restraunt_register> {
  TextEditingController _restname = TextEditingController();
  TextEditingController _restdec = TextEditingController();
  TextEditingController _mobno = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _timeo = TextEditingController();
  TextEditingController _timec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 40.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              shrinkWrap: true,
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
                InputFieldgenerator("Restraunt Name", context,controller: _restname),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                InputFieldgenerator("Restraunt Description", context,controller: _restdec,
                // functi: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter some text';
                //   }
                //   return null;
                // }
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                InputNumfieldgenerator('Mobile No.', context, 10,on_changed_function: (String textinput){


                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 200,
                ),
                InputFieldgenerator("Full Address", context),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 65,
                ),
                Inputtimepicker(context, 'Opening Time',_timeo),
                Inputtimepicker(context, 'Closing Time',_timec),
                SizedBox(
                  height: MediaQuery.of(context).size.height/40,
                ),
                buttongenerator('Next', context, (){
                  Navigator.pushReplacementNamed(
                                      context, '/main_home');
                })
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}
