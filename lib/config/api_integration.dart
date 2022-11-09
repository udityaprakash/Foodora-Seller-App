import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'api_links.dart';

dynamic sign_in(String email, String password) async {
  try {
    log("Attempting Sign IN");
    final response = await post(Uri.parse(sign_in_link),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        }));

    final output = jsonDecode(response.body);
    if (response != null) {
      log("Response Recieved as " + output.toString());
    }
    return output;
  } catch (er) {
    log("error caught: " + er.toString());
  }
}

dynamic send_api_otp(String email) async {
  try {
    log("Initialised OTP send at: " + email);
    final response = await post(Uri.parse(otp_send_link),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": email,
        }));
    final output = jsonDecode(response.body);
    log(output.toString());
    return output;
  } catch (er) {
    log("error caught: " + er.toString());
  }
}

dynamic sign_up(String name, String email, String password) async {
  try {
    log("Seller Sign UP Started for " + email);
    final response = await post(Uri.parse(sign_up_link),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": name,
          "email": email,
          "password": password,
        }));
    final output = jsonDecode(response.body);
    log(output.toString());
    return output;
  } catch (er) {
    log("error caught: " + er.toString());
  }
}

dynamic otp_correct(String email, String OTP) async {
  try {
    log("Initialised OTP verification begun for: " + email);
    final response = await post(Uri.parse(otp_check_link),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"email": email, "otp": OTP}));
    final output = jsonDecode(response.body);
    log("otp check results: " + output.toString());
    return output;
  } catch (er) {
    log("error caught: " + er.toString());
  }
}

dynamic forget_otp_send(String email) async {
  try {
    log("Initialised Forget OTP sent for: " + email);
    final response = await post(Uri.parse(forget_otp_send_link),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"email": email}));
    final output = jsonDecode(response.body);
    log("otp send results: " + output.toString());
    return output;
  } catch (er) {
    log("error caught: " + er.toString());
  }
}

dynamic forget_otp_verify(String email, String OTP) async {
  try {
    log("Initialised forget OTP verification begun for: " + email);
    final response = await post(Uri.parse(forget_otp_verify_link),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"email": email, "otp": OTP}));
    final output = jsonDecode(response.body);
    log("otp check results: " + output.toString());
    return output;
  } catch (er) {
    log("error caught: " + er.toString());
  }
}

dynamic forget_new_password(String email, String password) async {
  try {
    log("Initialised Password Change Begun For: " + email);
    final response = await post(Uri.parse(forget_new_password_link),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}));
    final output = jsonDecode(response.body);
    log("set new password results: : " + output.toString());
    return output;
  } catch (er) {
    log("error caught: " + er.toString());
  }
}

dynamic restaurant_register(String id, String r_name, String mobilenumber,
    String address, String openingtime, String closingtime) async {
  try {
    log("Restraunt Registration of " + r_name + ' with id - ' + id.toString());
    final response = await post(
      Uri.parse(sign_up_link),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "id": id,
          "restaurantname": r_name,
          "mobilenumber": mobilenumber,
          "address": address,
          "openingtime": openingtime,
          "closingtime": closingtime
        },
      ),
    );
    final output = jsonDecode(response.body);
    log(output.toString());
    return output;
  } catch (er) {
    log("error caught: " + er.toString());
  }
}
