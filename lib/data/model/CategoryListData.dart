class CategoryListData {
  CategoryListData({
    num? id,
    String? categoryName,
    String? categoryImg,
    String? createdAt,
    String? updatedAt,}){
    _id = id;
    _categoryName = categoryName;
    _categoryImg = categoryImg;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  CategoryListData.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['categoryName'];
    _categoryImg = json['categoryImg'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _categoryName;
  String? _categoryImg;
  String? _createdAt;
  String? _updatedAt;
  CategoryListData copyWith({  num? id,
    String? categoryName,
    String? categoryImg,
    String? createdAt,
    String? updatedAt,
  }) => CategoryListData(  id: id ?? _id,
    categoryName: categoryName ?? _categoryName,
    categoryImg: categoryImg ?? _categoryImg,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
  );
  num? get id => _id;
  String? get categoryName => _categoryName;
  String? get categoryImg => _categoryImg;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categoryName'] = _categoryName;
    map['categoryImg'] = _categoryImg;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}