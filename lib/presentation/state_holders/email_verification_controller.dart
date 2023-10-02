


import 'dart:core';

import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class EmailVerificationController extends GetxController{

  bool _emailVerificationInProgress = false;
  String _message = '';
  bool get emailVerificationInprocess =>_emailVerificationInProgress;

  String get message => _message;


  Future<bool>verifyEmail(String email)async{
    _emailVerificationInProgress = true;
    update();// rebuild get builder
    final NetworkResponse response  = await NetworkCaller().getRequest(Urls.verifyEmail(email));
    _emailVerificationInProgress = false;
    update();
    if(response.isSuccess){
      _message=response.responseJson['data']?? '';
        return true;
    }else{
      _message = "email verificaiton failed";
      return false;

    }


  }




}