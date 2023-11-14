
import 'package:ecommerce/data/Services/network_caller.dart';
import 'package:ecommerce/data/model/invoice_create_response_model.dart';
import 'package:ecommerce/data/model/network_response.dart';
import 'package:get/get.dart';

import '../../data/utility/Urls.dart';

class CreateInvoiceController extends GetxController{
  bool _inProgress = false;
  String _message = '';
  InvoiceCreateResponseModel _invoiceCreateResponseModel = InvoiceCreateResponseModel();
  bool get inProgress => _inProgress;

  String get message => _message;
  InvoiceCreateData? get invoiceCreateResponseModel => _invoiceCreateResponseModel.data?.first;

  Future<bool>createInvoice()async{

    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.createInvoice);
    _inProgress = false;
    update();
    if(response.isSuccess && response.responseJson!['msg']=='success'){
      _invoiceCreateResponseModel = InvoiceCreateResponseModel.fromJson(response.responseJson!);

      return true;

    }
    else{
      _message = 'Invoice Creation Failed! try again';
      return false;
    }
  }
}