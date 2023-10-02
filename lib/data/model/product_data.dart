import 'package:ecommerce/data/model/CategoryListData.dart';

import 'brand.dart';

class ProductData {
  ProductData({
    num? id,
    String? title,
    String? shortDes,
    String? price,
    num? discount,
    String? discountPrice,
    String? image,
    num? stock,
    num? star,
    String? remark,
    num? categoryId,
    num? brandId,
    String? createdAt,
    String? updatedAt,
    Brand? brand,
    CategoryListData? category,}){
    _id = id;
    _title = title;
    _shortDes = shortDes;
    _price = price;
    _discount = discount;
    _discountPrice = discountPrice;
    _image = image;
    _stock = stock;
    _star = star;
    _remark = remark;
    _categoryId = categoryId;
    _brandId = brandId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _brand = brand;
    _category = category;
  }

  ProductData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _shortDes = json['short_des'];
    _price = json['price'];
    _discount = json['discount'];
    _discountPrice = json['discount_price'];
    _image = json['image'];
    _stock = json['stock'];
    _star = json['star'];
    _remark = json['remark'];
    _categoryId = json['category_id'];
    _brandId = json['brand_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _category = json['category'] != null ? CategoryListData.fromJson(json['category']) : null;
  }
  num? _id;
  String? _title;
  String? _shortDes;
  String? _price;
  num? _discount;
  String? _discountPrice;
  String? _image;
  num? _stock;
  num? _star;
  String? _remark;
  num? _categoryId;
  num? _brandId;
  String? _createdAt;
  String? _updatedAt;
  Brand? _brand;
  CategoryListData? _category;
  ProductData copyWith({  num? id,
    String? title,
    String? shortDes,
    String? price,
    num? discount,
    String? discountPrice,
    String? image,
    num? stock,
    num? star,
    String? remark,
    num? categoryId,
    num? brandId,
    String? createdAt,
    String? updatedAt,
    Brand? brand,
    CategoryListData? category,
  }) => ProductData(  id: id ?? _id,
    title: title ?? _title,
    shortDes: shortDes ?? _shortDes,
    price: price ?? _price,
    discount: discount ?? _discount,
    discountPrice: discountPrice ?? _discountPrice,
    image: image ?? _image,
    stock: stock ?? _stock,
    star: star ?? _star,
    remark: remark ?? _remark,
    categoryId: categoryId ?? _categoryId,
    brandId: brandId ?? _brandId,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    brand: brand ?? _brand,
    category: category ?? _category,
  );
  num? get id => _id;
  String? get title => _title;
  String? get shortDes => _shortDes;
  String? get price => _price;
  num? get discount => _discount;
  String? get discountPrice => _discountPrice;
  String? get image => _image;
  num? get stock => _stock;
  num? get star => _star;
  String? get remark => _remark;
  num? get categoryId => _categoryId;
  num? get brandId => _brandId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Brand? get brand => _brand;
  CategoryListData? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['short_des'] = _shortDes;
    map['price'] = _price;
    map['discount'] = _discount;
    map['discount_price'] = _discountPrice;
    map['image'] = _image;
    map['stock'] = _stock;
    map['star'] = _star;
    map['remark'] = _remark;
    map['category_id'] = _categoryId;
    map['brand_id'] = _brandId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}