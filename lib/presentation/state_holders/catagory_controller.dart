import 'dart:core';
import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';
import '../../data/model/CategoryListModel.dart';
import '../../data/utility/Urls.dart';

class CategoryController extends GetxController{


  CategoryListModel _categoryListModel =CategoryListModel();

  CategoryListModel get categoryListModel =>_categoryListModel;

  bool _getCategoryListInProgress = false;

  bool get getCategoryListInProgress =>_getCategoryListInProgress;



  Future<bool>getCategoryList()async{
    _getCategoryListInProgress = true;
    update();// rebuild get builder
    final NetworkResponse response  = await NetworkCaller.getRequest(Urls.getCategoryList);
    _getCategoryListInProgress = false;
    update();
    if(response.isSuccess){
      _categoryListModel =CategoryListModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      return false;
    }


  }




}