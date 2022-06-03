import 'package:aag_e_order_app/models/model/product.dart';

class CartItemsApiResponse {
  CartItemsApiResponse({
    bool? result,
    String? message,
    List<CartData>? data,
    int? totalPrice,
  }) {
    _result = result;
    _message = message;
    _data = data;
    _totalPrice = totalPrice;
  }

  CartItemsApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CartData.fromJson(v));
      });
    }
    _totalPrice = json['totalPrice'];
  }

  bool? _result;
  String? _message;
  List<CartData>? _data;
  int? _totalPrice;

  bool? get result => _result;

  String? get message => _message;

  List<CartData>? get data => _data;

  int? get totalPrice => _totalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = _totalPrice;
    return map;
  }
}

class CartData {
  CartData({
    int? price,
    int? id,
    String? quantity,
    String? createdAt,
    String? updatedAt,
    int? productId,
    int? userId,
    Product? product,
  }) {
    _price = price;
    _id = id;
    _quantity = quantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _productId = productId;
    _userId = userId;
    _product = product;
  }

  CartData.fromJson(dynamic json) {
    _price = json['price'];
    _id = json['id'];
    _quantity = json['quantity'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _productId = json['productId'];
    _userId = json['userId'];
    _product = json['Product'] != null ? Product.fromJson(json['Product']) : null;
  }

  int? _price;
  int? _id;
  String? _quantity;
  String? _createdAt;
  String? _updatedAt;
  int? _productId;
  int? _userId;
  Product? _product;

  int? get price => _price;

  int? get id => _id;

  String? get quantity => _quantity;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get productId => _productId;

  int? get userId => _userId;

  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['id'] = _id;
    map['quantity'] = _quantity;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['productId'] = _productId;
    map['userId'] = _userId;
    if (_product != null) {
      map['Product'] = _product?.toJson();
    }
    return map;
  }
}
