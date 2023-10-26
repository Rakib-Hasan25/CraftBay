
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
  double get totalPrice =>_totalPrice;

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
      //jokon cart list ta load hocce tokon calculate korche
      _calculateTotalPrice();
      update();
      return true;
    }
    else{
      _message = 'Cart list get Failed! try again';
      return false;
    }
  }
  Future<bool>removeFromCart(int id)async{
    _getCartListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.removeFromCart(id));
    _getCartListInProgress = false;
    if(response.isSuccess){
      _cartListModel.data?.removeWhere((element) => element.productId == id);
      _calculateTotalPrice();
      update();
      return true;
    }
    else{
        return false;
    }
  }
  
  
  
  
  
  // jokon element barabo tokon nicher kaaj gula hobe
  void addItem(int cartId,int noOfItems){
    _cartListModel.data?.firstWhere((e) => e.id == cartId ).numberofItem =noOfItems;
    _calculateTotalPrice();
    /*1.amader cartlist e loop chalacci, 'e' holo every particular element
      2.amader selected cartid er shate e er id match hole
      3.cartlist model er cartdata ekta function e numberofItem equal amader seleced noOfitem
      kore dibo

    */
  }
  //prottek bar cart list er sob data ke calculation korchi
  void _calculateTotalPrice(){
    _totalPrice =0 ;
    for(CartData singleData in _cartListModel.data ?? []){
      _totalPrice +=singleData.numberofItem *
          (double.tryParse(singleData.product?.price??'0')??0);
    }
    update();
  }

}