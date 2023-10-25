import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/Product_Model.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class NewProductController extends GetxController {
  bool _getNewProductInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';
  bool get getNewProductsInProgress => _getNewProductInProgress;

  ProductModel get NewProductModel => _newProductModel;
  String get errorMessage => _errorMessage;

  Future<bool> getNewProducts() async {
    _getNewProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductByRemarks('New'));
    _getNewProductInProgress = false;
    if (response.isSuccess){
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {} );
      update();

      return true;
    }
    else{
      _errorMessage = 'New Product fetch failed! Try Again';
      update();
      return false;
    }
  }
}
