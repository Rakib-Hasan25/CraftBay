class SliderData {
  SliderData({
    num? id,
    String? title,
    String? shortDes,
    String? image,
    num? productId,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _title = title;
    _shortDes = shortDes;
    _image = image;
    _productId = productId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  SliderData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _shortDes = json['short_des'];
    _image = json['image'];
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _shortDes;
  String? _image;
  num? _productId;
  String? _createdAt;
  String? _updatedAt;
  SliderData copyWith({  num? id,
    String? title,
    String? shortDes,
    String? image,
    num? productId,
    String? createdAt,
    String? updatedAt,
  }) => SliderData(  id: id ?? _id,
    title: title ?? _title,
    shortDes: shortDes ?? _shortDes,
    image: image ?? _image,
    productId: productId ?? _productId,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  num? get id => _id;
  String? get title => _title;
  String? get shortDes => _shortDes;
  String? get image => _image;
  num? get productId => _productId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['short_des'] = _shortDes;
    map['image'] = _image;
    map['product_id'] = _productId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}