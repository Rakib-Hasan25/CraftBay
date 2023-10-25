
import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/cart_list_model.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class CartListController extends GetxController{
  bool _getCartListInProgress = false;
  String _message = '';
  CartListModel _cartListModel = CartListModel();
  double _totalPrice = 0;

  bool get addToCartInProgress => _getCartListInProgress;
  CartListModel get cartListModel => _cartListModel;
  String get message => _message;


  Future<bool>getCartList()async{
    _getCartListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getCartList);
    _getCartListInProgress = false;
    if(response.isSuccess){
      _cartListModel = CartListModel.fromJson(response.responseJson);
      _calculateTotalPrice();
      update();
      return true;
    }
    else{
      _message = 'Cart list get Failed! try again';
      return false;
    }
  }
  void addItem(int cartId,int noOfItems){
    _cartListModel.data?.firstWhere((e) => e.id == cartId ).numberofItem =noOfItems;
    _calculateTotalPrice();
    /*1.amader cartlist e loop chalacci, 'e' holo every particular element
      2.amader selected cartid er shate e er id match hole
      3.cartlist model er cartdata ekta function e numberofItem equal amader seleced noOfitem
      kore dibo

    */
  }
  void _calculateTotalPrice(){
    for(CartData data in _cartListModel.data ?? []){
      _totalPrice +=data.numberofItem *
          (double.tryParse(data.product?.price??'0')??0);
    }
    update();
  }

}