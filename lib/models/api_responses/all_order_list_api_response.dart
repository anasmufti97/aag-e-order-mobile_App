import 'package:aag_e_order_app/models/model/user.dart';

class AllOrderListApiResponse {
  AllOrderListApiResponse({
    bool? result,
    String? message,
    List<OrderData>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  AllOrderListApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(OrderData.fromJson(v));
      });
    }
  }

  bool? _result;
  String? _message;
  List<OrderData>? _data;

  bool? get result => _result;

  String? get message => _message;

  List<OrderData>? get data => _data;

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

class OrderData {
  OrderData({
    int? id,
    dynamic status,
    dynamic invoiceNumber,
    String? createdAt,
    String? updatedAt,
    int? customerId,
    int? zmId,
    User? user,
    ZM? zm,
    List<dynamic>? products,
    int? totalPrice,
  }) {
    _id = id;
    _status = status;
    _invoiceNumber = invoiceNumber;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _customerId = customerId;
    _zmId = zmId;
    _user = user;
    _zm = zm;
    _products = products;
    _totalPrice = totalPrice;
  }

  OrderData.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _invoiceNumber = json['invoiceNumber'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _customerId = json['customerId'];
    _zmId = json['zmId'];
    _user = json['User'] != null ? User.fromJson(json['User']) : null;
    _zm = json['ZM'] != null ? ZM.fromJson(json['ZM']) : null;
    if (json['Products'] != null) {
      _products = [];
      json['Products'].forEach((v) {
        _products?.add(v);
      });
    }
    _totalPrice = json['totalPrice'];
  }

  int? _id;
  dynamic _status;
  dynamic _invoiceNumber;
  String? _createdAt;
  String? _updatedAt;
  int? _customerId;
  int? _zmId;
  User? _user;
  ZM? _zm;
  List<dynamic>? _products;
  int? _totalPrice;

  int? get id => _id;

  dynamic get status => _status;

  dynamic get invoiceNumber => _invoiceNumber;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get customerId => _customerId;

  int? get zmId => _zmId;

  User? get user => _user;

  ZM? get zm => _zm;

  List<dynamic>? get products => _products;

  int? get totalPrice => _totalPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['invoiceNumber'] = _invoiceNumber;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['customerId'] = _customerId;
    map['zmId'] = _zmId;
    if (_user != null) {
      map['User'] = _user?.toJson();
    }
    if (_zm != null) {
      map['ZM'] = _zm?.toJson();
    }
    if (_products != null) {
      map['Products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = _totalPrice;
    return map;
  }
}

class ZM {
  ZM({
    int? id,
    String? fullName,
    String? email,
    String? password,
    String? address,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _fullName = fullName;
    _email = email;
    _password = password;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ZM.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['fullName'];
    _email = json['email'];
    _password = json['password'];
    _address = json['address'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  int? _id;
  String? _fullName;
  String? _email;
  String? _password;
  String? _address;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  String? get fullName => _fullName;

  String? get email => _email;

  String? get password => _password;

  String? get address => _address;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['password'] = _password;
    map['address'] = _address;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
