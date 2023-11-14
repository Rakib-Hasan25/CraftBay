import 'PaymentMethod.dart';

class InvoiceCreateResponseModel {
  String? msg;
  List<InvoiceCreateData>? data;

  InvoiceCreateResponseModel({this.msg, this.data});

  InvoiceCreateResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <InvoiceCreateData>[];
      json['data'].forEach((v) {
        data!.add(InvoiceCreateData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceCreateData {
  List<PaymentMethod>? paymentMethod;
  int? payable;
  int? vat;
  int? total;

  InvoiceCreateData({this.paymentMethod, this.payable, this.vat, this.total});

  InvoiceCreateData.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethod = <PaymentMethod>[];
      json['paymentMethod'].forEach((v) {
        paymentMethod!.add(PaymentMethod.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (paymentMethod != null) {
      data['paymentMethod'] =
          paymentMethod!.map((v) => v.toJson()).toList();
    }
    data['payable'] = this.payable;
    data['vat'] = this.vat;
    data['total'] = this.total;
    return data;
  }
}


