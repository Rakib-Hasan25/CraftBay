


import 'dart:core';

import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:ecommerce/data/model/slider_model.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class HomeSliderController extends GetxController{
  CategoryListModel _sliderModel =CategoryListModel();

  CategoryListModel get sliderModel =>_sliderModel;

  bool _getHomeSliderInProgress = false;

  bool get getHomeSliderInProgress =>_getHomeSliderInProgress;



  Future<bool>getHomeSlider()async{
    _getHomeSliderInProgress = true;
    update();// rebuild get builder
    final NetworkResponse response  = await NetworkCaller().getRequest(Urls.getHomeSlider);
    _getHomeSliderInProgress = false;
    update();
    if(response.isSuccess){
      _sliderModel =CategoryListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      return false;

    }


  }




}