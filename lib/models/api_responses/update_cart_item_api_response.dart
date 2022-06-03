class UpdateCartItemApiResponse {
  UpdateCartItemApiResponse({
    bool? result,
    String? message,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  UpdateCartItemApiResponse.fromJson(dynamic json) {
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
    int? quantity,
    String? createdAt,
    String? updatedAt,
    int? productId,
    int? userId,
  }) {
    _id = id;
    _quantity = quantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _productId = productId;
    _userId = userId;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _productId = json['productId'];
    _userId = json['userId'];
  }

  int? _id;
  int? _quantity;
  String? _createdAt;
  String? _updatedAt;
  int? _productId;
  int? _userId;

  int? get id => _id;

  int? get quantity => _quantity;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get productId => _productId;

  int? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = _quantity;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['productId'] = _productId;
    map['userId'] = _userId;
    return map;
  }
}
