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
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 50),
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

Widget InputFieldgenerator(String hinttxt, BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 15,
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

Widget Inputpassfield(String hinttxt, bool _passwordVisible, context, funct) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 15,
    child: TextFormField(
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
  return Container(
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
  );
}

Widget Toppageicon() {
  return Padding(
    padding: const EdgeInsets.only(top:8.0),
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
