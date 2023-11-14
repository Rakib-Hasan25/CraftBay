import 'package:ecommerce/data/model/product_data.dart';



class ProductModel {
  String? _msg;
  List<ProductData>? _data;

  ProductModel({
      String? msg, 
      List<ProductData>? data,}){
    _msg = msg;
    _data = data;
}
  ProductModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductData.fromJson(v));
      });
    }
  }

ProductModel copyWith({  String? msg,
  List<ProductData>? data,
}) => ProductModel(  msg: msg ?? _msg,
  data: data ?? _data,
);

  String? get msg => _msg;
  List<ProductData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


