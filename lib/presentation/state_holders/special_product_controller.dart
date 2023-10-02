import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/Product_Model.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialProductInProgress = false;
  ProductModel _specialProductModel = ProductModel();
  String _errorMessage = '';
  bool get getSpecialProductsInProgress => _getSpecialProductInProgress;

  ProductModel get SpecialProductModel => _specialProductModel;
  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProducts() async {
    _getSpecialProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductByRemarks('Special'));
    _getSpecialProductInProgress = false;
    if (response.isSuccess){
      _specialProductModel = ProductModel.fromJson(response.responseJson ?? {} );
      update();

      return true;
    }
    else{
      _errorMessage = 'Special Product fetch failed! Try Again';
      update();
      return false;
    }
  }
}
