// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textfield_datepicker/textfield_timePicker.dart';

import '../config/api_integration.dart';

const blue_background = Color.fromRGBO(50, 81, 255, 1);

bool isEmail(String email) {
  if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}

bool isStrong(String? password) {
  if (password == null) {
    return false;
  } else if (RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}

Widget buttongenerator(String quote, BuildContext context, function) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(50, 81, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        // side: const BorderSide(
        //     color: Colors.white),
      ),
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 60),
        child: Text(
          quote,
          style: TextStyle(
              letterSpacing: 2,
              color: Colors.white,
              fontFamily: 'Raleway',
              fontVariations: <FontVariation>[FontVariation('wght', 700)],
              fontSize: MediaQuery.of(context).size.width / 16),
        ),
      ),
    ),
  );
}

Widget svggenerator(double h, double w, String uri) {
  return SvgPicture.asset(
    uri,
    width: w,
    height: h,
  );
}

Widget textgenerator(
    String tex, double fontSiz, String fontfamly, double weit, Color co) {
  return Text(
    tex,
    style: TextStyle(
      fontFamily: fontfamly,
      fontSize: fontSiz,
      color: co,
      fontVariations: <FontVariation>[FontVariation('wght', weit)],
    ),
  );
}

Widget errortextgenerator(String tex, double fontS, double weit) {
  return Text(
    tex,
    style: TextStyle(
      fontFamily: 'Raleway',
      fontSize: fontS,
      color: Colors.red,
      fontVariations: <FontVariation>[FontVariation('wght', weit)],
    ),
  );
}

Widget InputFieldgenerator(String hinttxt, BuildContext context,
    {controller, maxlines, functi, check}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 15,
    child: TextFormField(
      maxLines: 1,
      autofocus: true,
      controller: controller,
      onChanged: check,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,
      ),
      validator: functi,
      //     (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
          isDense: true,
          hintText: hinttxt,
          hintStyle: const TextStyle(
              color: Colors.white54,
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700),
          fillColor: Color.fromRGBO(150, 150, 150, 1.5),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    ),
  );
}

Widget Textlink(String tex, double fontsiz, BuildContext context,
    double fontweit, Color co, function) {
  return TextButton(
    onPressed: function,
    child: Text(
      tex,
      style: TextStyle(
          letterSpacing: 1,
          color: co,
          fontFamily: 'Raleway',
          fontVariations: <FontVariation>[FontVariation('wght', fontweit)],
          fontSize: fontsiz),
    ),
  );
}

Widget Inputpassfield(String hinttxt, bool _passwordVisible, context, funct,
    {controller}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 15,
    child: TextFormField(
      maxLines: 1,
      controller: controller,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,
      ),
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: funct,
        ),
        hintText: hinttxt,
        hintStyle: const TextStyle(
            color: Colors.white54,
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700),
        fillColor: Color.fromRGBO(150, 150, 150, 1.5),
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    ),
  );
}

Widget Backgroundimg(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            'assets/svg/bottompage.svg',
            width: MediaQuery.of(context).size.width,
          )
          // svggenerator(
          //     200, MediaQuery.of(context).size.width, 'assets/svg/bottompage.svg'),
          ),
    ),
  );
}

Widget Toppageicon() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      children: [
        Container(
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            color: Color.fromRGBO(50, 81, 255, 1),
          ),
          child: SvgPicture.asset(
            'assets/svg/logo.svg',
            height: 50,
          ),
        ),
      ],
    ),
  );
}

Widget Bottomgradient(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: MediaQuery.of(context).size.height / 4.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.white12]),
      ),
    ),
  );
}

Widget otp_field(BuildContext context, {function}) {
  final size = MediaQuery.of(context).size;
  return OTPTextField(
    keyboardType: TextInputType.number,
    length: 6,
    width: size.width > 330 ? 330 : size.width - 10,
    fieldWidth: size.width > 330 ? 330 / 7 : (size.width - 10) / 7,
    style: const TextStyle(fontSize: 20),
    textFieldAlignment: MainAxisAlignment.spaceAround,
    otpFieldStyle: OtpFieldStyle(
        borderColor: Colors.white, enabledBorderColor: Colors.white),
    fieldStyle: FieldStyle.box,
    onChanged: (pin) {
      function(pin);
    },
  );
}

Future<String?> idgrabber() async {
  try {
    final storage = new FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    return token;
  } catch (er) {}
}

Future<dynamic> sellerinfograbber() async {
  try {
    await put_seller_info();
    final seller_info_storage = await SharedPreferences.getInstance();
    if (seller_info_storage.getString("seller_info") == null) {
      return "seller Info Doesnt Exist";
    } else {
      final seller_info =
          jsonDecode(seller_info_storage.getString("seller_info")!);
      log("Seller Info " + seller_info.toString());
      return seller_info;
    }
  } catch (er) {}
}

Future<Map<dynamic, dynamic>?> put_seller_info() async {
  try {
    log("putting seller info");
    final storage = new FlutterSecureStorage();
    SharedPreferences user_info = await SharedPreferences.getInstance();
    Map? get_profile_response = await get_seller_info();
    user_info.setString('seller_info', jsonEncode(get_profile_response));
    return get_seller_info();
  } catch (er) {
    log(er.toString());
  }
}

Widget InputNumfieldgenerator(String hinttext, BuildContext context, int maxlen,
    {controller, on_changed_function}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 15,
    width: double.infinity,
    child: TextFormField(
      maxLines: 1,
      maxLength: maxlen,
      onChanged: on_changed_function,
      keyboardType: TextInputType.number,
      controller: controller,
      style: const TextStyle(
        fontSize: 20,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
          counterText: '',
          hintText: hinttext,
          hintStyle: const TextStyle(
              color: Colors.white54,
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700),
          fillColor: Color.fromRGBO(150, 150, 150, 1.5),
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    ),
  );
}

Widget Inputtimepicker(
    BuildContext context, String tex, TextEditingController _timeo) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 10,
    width: MediaQuery.of(context).size.width / 2.3,
    child: TextfieldTimePicker(
      textfieldDateAndTimePickerController: _timeo,
      cupertinoTimePickerUse24hFormat:true,
      cupertinoDatePickerBackgroundColor: Colors.black87,
      cupertinoDateInitialDateTime: DateTime(2022, 9, 7, 17, 30),
      materialInitialTime: new TimeOfDay(hour: 12, minute: 0),
      style: const TextStyle(
        fontSize: 20,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
          hintText: tex,
          hintStyle: const TextStyle(
              color: Colors.white54,
              fontSize: 18,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700),
          fillColor: Color.fromRGBO(150, 150, 150, 1.5),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    ),
  );
}

Widget Showbottomsheet(Uint8List im) {
  return Container(
    color: Colors.black,
    height: 140,
    width: double.infinity,
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: textgenerator(
            'Choose from below options', 20, 'Raleway', 700, Colors.white),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () async {
              fromcamera();
            },
            icon: const Icon(
              Icons.add_a_photo,
              size: 40,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              // Uint8List im = await fromgalary();
            },
            icon: const Icon(
              Icons.add_photo_alternate,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      )
    ]),
  );
}

void fromcamera() async {
  // final PickedFile = await pic.getImage(source: ImageSource.camera);
}

// fromgalary() async {
//   final ImagePicker imagePicker = ImagePicker();
//   XFile? _file = await imagePicker.pickImage(source: ImageSource.gallery);
//   if (_file != null) {
//     return _file.readAsBytes();
//   } else {
//     print("Image not selected");
//   }
// }

Future<List<XFile>> fromgalarymultiplePath() async {
  log("from gallery ");
  final imagePicker = ImagePicker();
  final List<XFile>? _file = await imagePicker.pickMultiImage();
  if (_file == null) {
    return [];
  }
  if (_file != []) {
    if (_file.length > 5) {
      _file.removeRange(4, _file.length - 1);
    }
  }
  for (int i = 0; i < _file.length; ++i) {
    log(_file[i].path);
  }

  return _file;
}

Widget Appbartop() {
  return AppBar(actions: []);
}

fromgalaryPath() async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? _file = await imagePicker.pickImage(source: ImageSource.gallery);
  if (_file != null) {
    return _file;
  } else {
    print("Image not selected");
  }
}

Widget DishTray(context) {
  return Container(
    height: 100,
    width: 100,
    color: Color.fromARGB(26, 139, 46, 46),
  );
}

Widget Acceptbtn(BuildContext context, {onpressed}) {
  return ElevatedButton(
    onPressed: onpressed,
    style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(0, 185, 185, 185),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 60),
        child: Text(
          'DONE',
          style: TextStyle(
              letterSpacing: 2,
              color: Colors.white,
              fontFamily: 'Raleway',
              fontVariations: <FontVariation>[FontVariation('wght', 500)],
              fontSize: MediaQuery.of(context).size.width / 18),
        ),
      ),
    ),
  );
}

Widget Rejectbtn(BuildContext context, {onpressed}) {
  return ElevatedButton(
    onPressed: onpressed,
    style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(0, 185, 185, 185),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17.0),
        side: const BorderSide(color: Colors.white),
      ),
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 60),
        child: Text(
          'Reject',
          style: TextStyle(
              letterSpacing: 2,
              color: Colors.white,
              fontFamily: 'Raleway',
              fontVariations: <FontVariation>[FontVariation('wght', 500)],
              fontSize: MediaQuery.of(context).size.width / 18),
        ),
      ),
    ),
  );
}

bool ismobilenumber(String value) {
  String pattern = r'(^[6-9][0-9]{9}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return false;
  } else if (regExp.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}

bool ispin(String pinnumber) {
  String pattern = r'(^[0-9]{6}$)';
  RegExp regExp = new RegExp(pattern);
  if (pinnumber.length == 0) {
    return false;
  } else if (regExp.hasMatch(pinnumber)) {
    return true;
  } else {
    return false;
  }
}
