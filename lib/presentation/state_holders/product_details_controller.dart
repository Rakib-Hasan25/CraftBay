

import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/product_details_data.dart';
import 'package:ecommerce/data/model/ProductDetailsModel.dart';

import 'package:ecommerce/data/model/network_response.dart';
import 'package:ecommerce/data/utility/Urls.dart';
import 'package:get/get.dart';


class ProductDetailsController extends GetxController{
  bool productDetailsInProgress = true;
  ProductDetailsData  _productDetailsData = ProductDetailsData ();
  ProductDetailsData get productDetailsData =>_productDetailsData;
  String _errorMessage ='';
  String get errorMessage =>_errorMessage;

  
  
  
  Future<bool>getProductDetails(int id)async{
    productDetailsInProgress = false;
    update();
    NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductDetails(id));
    if(response.isSuccess){

      _productDetailsData = ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      //amra url theke sob product er details peyeci kinto amader lagbe first product ta
      update();
      return true;
    }
    else{
      _errorMessage = "ProductDetails api fetch failed!!!";
      update();
      return false;
    }
}
  
}