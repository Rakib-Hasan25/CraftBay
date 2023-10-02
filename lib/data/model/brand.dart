class Brand {
  Brand({
    num? id,
    String? brandName,
    String? brandImg,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _brandName = brandName;
    _brandImg = brandImg;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _brandName = json['brandName'];
    _brandImg = json['brandImg'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _brandName;
  String? _brandImg;
  String? _createdAt;
  String? _updatedAt;
  Brand copyWith({  num? id,
    String? brandName,
    String? brandImg,
    String? createdAt,
    String? updatedAt,
  }) => Brand(  id: id ?? _id,
    brandName: brandName ?? _brandName,
    brandImg: brandImg ?? _brandImg,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  num? get id => _id;
  String? get brandName => _brandName;
  String? get brandImg => _brandImg;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['brandName'] = _brandName;
    map['brandImg'] = _brandImg;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}