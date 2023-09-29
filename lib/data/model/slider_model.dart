import 'package:ecommerce/data/model/slider_data.dart';

/// msg : "success"
/// data : [{"id":1,"title":"Happy New Year\r\nSpecial Deal \r\nSave 30%","short_des":"Reference site about Lorem Ipsum, giving information on its origins","image":"https://photo.teamrabbil.com/images/2023/04/04/product.png","product_id":1,"created_at":"2023-02-19T09:17:51.000000Z","updated_at":"2023-04-04T15:26:48.000000Z"},{"id":2,"title":"Happy New Year\r\nSpecial Deal \r\nSave 30%","short_des":"Reference site about Lorem Ipsum, giving information on its origins","image":"https://photo.teamrabbil.com/images/2023/04/04/product.png","product_id":2,"created_at":"2023-02-19T09:17:51.000000Z","updated_at":"2023-04-04T15:26:52.000000Z"},{"id":3,"title":"Happy New Year\r\nSpecial Deal \r\nSave 30%","short_des":"Reference site about Lorem Ipsum, giving information on its origins","image":"https://photo.teamrabbil.com/images/2023/04/04/product.png","product_id":3,"created_at":"2023-02-19T09:17:51.000000Z","updated_at":"2023-04-04T15:26:56.000000Z"},{"id":4,"title":"Happy New Year\r\nSpecial Deal \r\nSave 30%","short_des":"Reference site about Lorem Ipsum, giving information on its origins","image":"https://photo.teamrabbil.com/images/2023/04/04/product.png","product_id":4,"created_at":"2023-02-19T09:17:51.000000Z","updated_at":"2023-04-04T15:26:59.000000Z"}]

class SliderModel {
  String? _msg;
  List<SliderData>? _data;


  //it is constuctor ;
  SliderModel({String? msg, List<SliderData>? data,}) {
    _msg = msg;
    _data = data;
  }

//it is factory constructor ; it can be called without creating an instance of it
  SliderModel.fromJson(dynamic json) {
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SliderData.fromJson(v));
      });
    }
  }

  SliderModel copyWith({
    String? msg,
    List<SliderData>? data,
  }) =>
      SliderModel(
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  String? get msg => _msg;
  List<SliderData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// title : "Happy New Year\r\nSpecial Deal \r\nSave 30%"
/// short_des : "Reference site about Lorem Ipsum, giving information on its origins"
/// image : "https://photo.teamrabbil.com/images/2023/04/04/product.png"
/// product_id : 1
/// created_at : "2023-02-19T09:17:51.000000Z"
/// updated_at : "2023-04-04T15:26:48.000000Z"
