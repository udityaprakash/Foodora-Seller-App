// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        padding: const EdgeInsets.all(15.0),
        child: Text(
          quote,
          style: const TextStyle(
              letterSpacing: 2,
              color: Colors.white,
              fontFamily: 'Raleway',
              fontVariations: <FontVariation>[FontVariation('wght', 700)],
              fontSize: 23.0),
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

Widget InputFieldgenerator(String hinttxt) {
  return SizedBox(
    height: 55,
    child: TextFormField(
      style: const TextStyle(
        fontSize: 20,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
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
    double fontweit,Color co, function) {
  return TextButton(
    onPressed: function,
    child: Text(
      tex,
      style: TextStyle(
          letterSpacing: 2,
          color: co,
          fontFamily: 'Raleway',
          fontVariations: <FontVariation>[FontVariation('wght', fontweit)],
          fontSize: fontsiz),
    ),
  );
}
