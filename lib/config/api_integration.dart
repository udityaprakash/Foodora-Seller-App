import 'dart:convert';
import 'dart:developer';
import 'package:http_parser/http_parser.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

Future<Map?> get_seller_info() async {
  try {
    final storage = new FlutterSecureStorage();
    String? token = await storage.read(key: 'access_token');
    String? id = await storage.read(key: 'token');
    log("Initialised Profile get for: " + id!);
    final response = await post(Uri.parse(seller_profile_link),
        headers: <String, String>{
          HttpHeaders.authorizationHeader: token!,
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{"_id": id}));
    final Map output = jsonDecode(response.body);
    log("response of the profile : " + output.toString());
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

dynamic restaurant_register(
    String id,
    String r_name,
    String mobilenumber,
    String address,
    String openingtime,
    String closingtime,
    List<File?> image) async {
  try {
    log("Registring Restraunt");

    var request = MultipartRequest('POST', Uri.parse(restaurant_register_link));

    for (int i = 0; i < image.length; ++i) {
      log(image[i]!.path);
      request.files.add(
        MultipartFile(
            'image', image[i]!.readAsBytes().asStream(), image[i]!.lengthSync(),
            filename: "something.jpg", contentType: MediaType('image', 'jpg')),
      );
    }

    request.fields['id'] = id;
    request.fields['restaurantname'] = r_name;
    request.fields['mobilenumber'] = mobilenumber;
    request.fields['restaurantaddress'] = address;
    request.fields['restaurant_openingtime'] = openingtime;
    request.fields['restaurant_closingtime'] = closingtime;

    var response = await request.send();
    var result = await response.stream.bytesToString();
    log(result.toString());
    return jsonDecode(result);
  } catch (er) {
    log("error caught: " + er.toString());
  }
}

dynamic restaurant_modify(
    String id,
    String? r_name,
    String? mobilenumber,
    String? address,
    String? openingtime,
    String? closingtime,
    List<File?> image) async {
  try {
    log("Registring Restraunt");

    var request = MultipartRequest('POST', Uri.parse(restaurant_register_link));

    if (image.isNotEmpty) {
      for (int i = 0; i < image.length; ++i) {
        log(image[i]!.path);
        request.files.add(
          MultipartFile('image', image[i]!.readAsBytes().asStream(),
              image[i]!.lengthSync(),
              filename: "something.jpg",
              contentType: MediaType('image', 'jpg')),
        );
      }
    }

    request.fields['id'] = id;
    log('res name: ' + r_name.toString());
    if (r_name != null) {
      if (r_name.toString().isNotEmpty) {
        log('changing res name');
        request.fields['restaurantname'] = r_name;
      }
    }
    if (mobilenumber != null) {
      if(mobilenumber.toString().isNotEmpty){
      request.fields['mobilenumber'] = mobilenumber;

      }
    }
    if (address != null) {
        if(address.toString().isNotEmpty){

      request.fields['restaurantaddress'] = address;
        }
    } else {
      final seller_info = await get_seller_info();

      request.fields['restaurantaddress'] =
          seller_info!['sellerDetails']['restaurantaddress'];
    }

    if (openingtime != null) {
      if(openingtime.toString().isNotEmpty){

      request.fields['restaurant_openingtime'] = openingtime;
      }
    }
    if (closingtime != null) {
      if(closingtime.toString().isNotEmpty){

      request.fields['restaurant_closingtime'] = closingtime;
      }
    }

    var response = await request.send();
    var result = await response.stream.bytesToString();
    log(result.toString());
    return jsonDecode(result);
  } catch (er) {
    log("error caught at modify:" + er.toString());
  }
}

dynamic food_list(
    String id, String foodname, String food_price, String food_desc,
    {File? image}) async {
  try {
    log("Adding Dish");

    var request = MultipartRequest('POST', Uri.parse(food_list_link));
    if (image != null) {
      request.files.add(
        MultipartFile(
            'image', image.readAsBytes().asStream(), image.lengthSync(),
            filename: "something.jpg", contentType: MediaType('image', 'jpg')),
      );
    }

    request.fields['id'] = id;
    request.fields['foodname'] = foodname;
    request.fields['food_price'] = food_price;
    request.fields['food_desc'] = food_desc;

    var response = await request.send();
    var result = await response.stream.bytesToString();
    log(result.toString());
    return jsonDecode(result);
  } catch (er) {
    log("error caught: " + er.toString());
  }
}
