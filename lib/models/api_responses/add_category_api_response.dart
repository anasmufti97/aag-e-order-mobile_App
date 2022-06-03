class AddCategoryApiResponse {
  AddCategoryApiResponse({
    bool? result,
    String? message,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  AddCategoryApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _result;
  String? _message;
  Data? _data;

  bool? get result => _result;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    int? id,
    String? productCategory,
    String? categoryCode,
    int? reportSortingOrder,
    String? updatedAt,
    String? createdAt,
  }) {
    _id = id;
    _productCategory = productCategory;
    _categoryCode = categoryCode;
    _reportSortingOrder = reportSortingOrder;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _productCategory = json['productCategory'];
    _categoryCode = json['categoryCode'];
    _reportSortingOrder = json['reportSortingOrder'];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
  }

  int? _id;
  String? _productCategory;
  String? _categoryCode;
  int? _reportSortingOrder;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;

  String? get productCategory => _productCategory;

  String? get categoryCode => _categoryCode;

  int? get reportSortingOrder => _reportSortingOrder;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['productCategory'] = _productCategory;
    map['categoryCode'] = _categoryCode;
    map['reportSortingOrder'] = _reportSortingOrder;
    map['updatedAt'] = _updatedAt;
    map['createdAt'] = _createdAt;
    return map;
  }
}
