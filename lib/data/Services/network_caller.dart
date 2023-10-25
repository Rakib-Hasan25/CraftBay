import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/application/app.dart';
import 'package:ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:ecommerce/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url),

          headers: {
          'token': AuthController.accessToken.toString()
          }

      );

      log(response.statusCode.toString());
      //respnse.body it is a string
      log(response.body);
      if (response.statusCode == 200 ) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        goToLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  static Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      Response response = await post(
          Uri.parse(url),
          headers: {
            'Content-type':'application/json',
             'token': AuthController.accessToken.toString()
          },
          body: jsonEncode(body));
      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200 ) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          goToLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  static Future<void> goToLogin()async {
    await AuthController.clear();
    Navigator.pushAndRemoveUntil(CraftBay.globalKey.currentContext!,
        MaterialPageRoute(builder: (context)=> EmailVerificationScreen()), (route) => false);


  }
}
