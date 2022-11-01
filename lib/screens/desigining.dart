import 'dart:ui';

import 'package:flutter/material.dart';

import 'homepage/loginpage.dart';

Widget buttongenerator(String quote, BuildContext context, function) {
  return ElevatedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      shape: const StadiumBorder(),
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
