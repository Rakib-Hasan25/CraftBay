
import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class AddToCartController extends GetxController{
  bool _addToCartInProgress = false;
  String _message = '';

  bool get addToCartInProgress => _addToCartInProgress;

  String get message => _message;

  Future<bool>addToCart(int ProductId,String Color,String Size,int quantity)async{

    _addToCartInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.addToCart,{
      "product_id":ProductId,
      "color":Color,
      "size": Size ,
      "qty":quantity
    });
    _addToCartInProgress = false;
    update();
    if(response.isSuccess){
      return true;

    }
    else{
      _message = 'add To Cart Failed! try again';
      return false;
    }
  }
}