class Category {
  Category({
    int? id,
    String? productCategory,
    String? categoryCode,
    int? reportSortingOrder,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _productCategory = productCategory;
    _categoryCode = categoryCode;
    _reportSortingOrder = reportSortingOrder;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _productCategory = json['productCategory'];
    _categoryCode = json['categoryCode'];
    _reportSortingOrder = json['reportSortingOrder'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  int? _id;
  String? _productCategory;
  String? _categoryCode;
  int? _reportSortingOrder;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  String? get productCategory => _productCategory;

  String? get categoryCode => _categoryCode;

  int? get reportSortingOrder => _reportSortingOrder;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['productCategory'] = _productCategory;
    map['categoryCode'] = _categoryCode;
    map['reportSortingOrder'] = _reportSortingOrder;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
