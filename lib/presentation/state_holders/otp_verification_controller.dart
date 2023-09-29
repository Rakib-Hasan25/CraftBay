


import 'dart:core';

import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:ecommerce/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class OtpVerificationController extends GetxController{

  bool _OtpVerificationInProgress = false;
  String _message = '';
  bool get OtpVerificationInprocess =>_OtpVerificationInProgress;

  String get message => _message;


  Future<bool>verifyOtp(String email,String otp)async{
    _OtpVerificationInProgress = true;
    update();// rebuild get builder
    final NetworkResponse response  = await NetworkCaller().getRequest(Urls.verifyOtp(email,otp));
    _OtpVerificationInProgress = false;
    update();
    if(response.isSuccess){
      await AuthController.setAccessToken(response.responseJson?['data']);
      _message=response.responseJson['data']?? '';

        return true;
    }else{
      return false;

    }


  }




}