import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import '../model/network_response.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      log(response.statusCode.toString());
      //respnse.body it is a string
      log(response.body);
      if (response.statusCode == 200 &&
          jsonDecode(response.body)['status'] == 'sucess') {
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

  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      Response response = await post(Uri.parse(url), body: jsonEncode(body));
      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['status'] == 'sucess') {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          goToLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {}
    return NetworkResponse(false, -1, null);
  }

  void goToLogin() {}
}
