// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';


Widget buttongenerator(String quote, BuildContext context, function) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
    primary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
      side: const BorderSide(color:Color.fromRGBO(0, 0, 255, 1),
      width: 1.5 )
    ),
  ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          quote.toUpperCase(),
          style: const TextStyle(
              letterSpacing: 4,
              color: Color.fromRGBO(0, 0, 255, 1),
              fontFamily: 'Raleway',
              fontVariations: <FontVariation>[FontVariation('wght', 600)],
              fontSize: 30.0),
        ),
      ),
    ),
  );
}
