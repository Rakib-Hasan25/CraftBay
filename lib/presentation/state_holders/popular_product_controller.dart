import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/Product_Model.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class PopularProductController extends GetxController {
  bool _getPopularProductInProgress = false;
  ProductModel _popularProductModel = ProductModel();
  String _errorMessage = '';
  bool get getPopularProductsInProgress => _getPopularProductInProgress;

  ProductModel get PopularProductModel => _popularProductModel;
  String get errorMessage => _errorMessage;

  Future<bool> getPopularProducts() async {
    _getPopularProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductByRemarks('popular'));
    _getPopularProductInProgress = false;
    if (response.isSuccess){
      _popularProductModel = ProductModel.fromJson(response.responseJson ?? {} );
      update();

      return true;
    }
    else{
      _errorMessage = 'Popular Product fetch failed! Try Again';
      update();
      return false;
    }
  }
}
