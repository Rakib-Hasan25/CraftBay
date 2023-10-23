import 'dart:core';
import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/Product_Model.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';
import '../../data/model/CategoryListModel.dart';
import '../../data/utility/Urls.dart';

class ProductListController extends GetxController{


  ProductModel _productModel =ProductModel();

  ProductModel get ProductListModel =>_productModel;

  bool _getProductListInProgress = false;

  bool get getProductListInProgress =>_getProductListInProgress;



  Future<bool>getProductsByCategory(int categoryId)async{
    _getProductListInProgress = true;
    update();// rebuild get builder
    final NetworkResponse response  = await NetworkCaller().
    getRequest(Urls.getProductByCategory(categoryId));
    _getProductListInProgress = false;
    update();
    if(response.isSuccess){
      _productModel =ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{

      update();
      return false;
    }


  }

  void setProducts(ProductModel productModel){
    _productModel=productModel;
    update();
  }




}