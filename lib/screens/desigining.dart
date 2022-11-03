// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buttongenerator(String quote, BuildContext context, function) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      primary: Color.fromRGBO(0, 100, 255, 1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: const BorderSide(
          //     color: Colors.white),
              ),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
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
    color: Colors.white,
  );
}

Widget textgenerator(String tex, double fontSiz, String fontfamly,double weit) {
  return Text(
    tex,
    style: TextStyle(
      fontFamily: fontfamly,
      fontSize: fontSiz,
      fontVariations:  <FontVariation>[FontVariation('wght', weit)],
    ),
  );
}
