class AllCategoryApiResponse {
  AllCategoryApiResponse({
    bool? result,
    String? message,
    List<Category>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  AllCategoryApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Category.fromJson(v));
      });
    }
  }

  bool? _result;
  String? _message;
  List<Category>? _data;

  bool? get result => _result;

  String? get message => _message;

  List<Category>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

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
