

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


  List<String>_availableSizes=[];
  List<String>_availableColors=[];

  List<String> get availableColors =>_availableColors;
  List<String> get availableSizes =>_availableSizes;


  Future<bool>getProductDetails(int id)async{
    productDetailsInProgress = false;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductDetails(id));
    if(response.isSuccess){

      _productDetailsData = ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      //amra url theke sob product er details peyeci kinto amader lagbe first product ta

      _convertStringToColors(_productDetailsData.color ?? '');

      _convertStringToSizes(_productDetailsData.size??'');
      update();
      return true;
    }
    else{
      _errorMessage = "ProductDetails api fetch failed!!!";
      update();
      return false;
    }
}
    void _convertStringToSizes(String sizes){
      _availableSizes = sizes.split(',');
    }
  void _convertStringToColors(String colors){
    _availableColors = colors.split(',');
  }

  
}