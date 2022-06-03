class DeleteOrderProductApiResponse {
  DeleteOrderProductApiResponse({
    bool? result,
    String? message,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  DeleteOrderProductApiResponse.fromJson(dynamic json) {
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
    String? status,
    dynamic invoiceNumber,
    String? createdAt,
    String? updatedAt,
    int? customerId,
    int? zmId,
    dynamic zaId,
    List<Products>? products,
  }) {
    _id = id;
    _status = status;
    _invoiceNumber = invoiceNumber;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _customerId = customerId;
    _zmId = zmId;
    _zaId = zaId;
    _products = products;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _invoiceNumber = json['invoiceNumber'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _customerId = json['customerId'];
    _zmId = json['zmId'];
    _zaId = json['zaId'];
    if (json['Products'] != null) {
      _products = [];
      json['Products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }

  int? _id;
  String? _status;
  dynamic _invoiceNumber;
  String? _createdAt;
  String? _updatedAt;
  int? _customerId;
  int? _zmId;
  dynamic _zaId;
  List<Products>? _products;

  int? get id => _id;

  String? get status => _status;

  dynamic get invoiceNumber => _invoiceNumber;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get customerId => _customerId;

  int? get zmId => _zmId;

  dynamic get zaId => _zaId;

  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['invoiceNumber'] = _invoiceNumber;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['customerId'] = _customerId;
    map['zmId'] = _zmId;
    map['zaId'] = _zaId;
    if (_products != null) {
      map['Products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Products {
  Products({
    int? id,
    dynamic productCode,
    dynamic invetoryTypeID,
    dynamic formulationTypeID,
    String? productGenericName,
    dynamic purityPercentage,
    dynamic measuringUnitID,
    dynamic weightPackSize,
    String? remarks,
    bool? isVerified,
    bool? isActive,
    bool? isFocused,
    int? price,
    String? descriptions,
    int? items,
    int? quantity,
    int? salesTax,
    int? batchNumber,
    int? netAmount,
    String? image,
    String? createdAt,
    String? updatedAt,
    int? categoryId,
    dynamic measuringUnitId,
    int? policyId,
    OrderDetail? orderDetail,
  }) {
    _id = id;
    _productCode = productCode;
    _invetoryTypeID = invetoryTypeID;
    _formulationTypeID = formulationTypeID;
    _productGenericName = productGenericName;
    _purityPercentage = purityPercentage;
    _measuringUnitID = measuringUnitID;
    _weightPackSize = weightPackSize;
    _remarks = remarks;
    _isVerified = isVerified;
    _isActive = isActive;
    _isFocused = isFocused;
    _price = price;
    _descriptions = descriptions;
    _items = items;
    _quantity = quantity;
    _salesTax = salesTax;
    _batchNumber = batchNumber;
    _netAmount = netAmount;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _categoryId = categoryId;
    _measuringUnitId = measuringUnitId;
    _policyId = policyId;
    _orderDetail = orderDetail;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _productCode = json['productCode'];
    _invetoryTypeID = json['invetoryTypeID'];
    _formulationTypeID = json['formulationTypeID'];
    _productGenericName = json['productGenericName'];
    _purityPercentage = json['purityPercentage'];
    _measuringUnitID = json['measuringUnitID'];
    _weightPackSize = json['weightPackSize'];
    _remarks = json['remarks'];
    _isVerified = json['isVerified'];
    _isActive = json['isActive'];
    _isFocused = json['isFocused'];
    _price = json['price'];
    _descriptions = json['descriptions'];
    _items = json['items'];
    _quantity = json['quantity'];
    _salesTax = json['salesTax'];
    _batchNumber = json['batchNumber'];
    _netAmount = json['netAmount'];
    _image = json['image'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _categoryId = json['categoryId'];
    _measuringUnitId = json['measuringUnitId'];
    _policyId = json['policyId'];
    _orderDetail = json['OrderDetail'] != null ? OrderDetail.fromJson(json['OrderDetail']) : null;
  }

  int? _id;
  dynamic _productCode;
  dynamic _invetoryTypeID;
  dynamic _formulationTypeID;
  String? _productGenericName;
  dynamic _purityPercentage;
  dynamic _measuringUnitID;
  dynamic _weightPackSize;
  String? _remarks;
  bool? _isVerified;
  bool? _isActive;
  bool? _isFocused;
  int? _price;
  String? _descriptions;
  int? _items;
  int? _quantity;
  int? _salesTax;
  int? _batchNumber;
  int? _netAmount;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  int? _categoryId;
  dynamic _measuringUnitId;
  int? _policyId;
  OrderDetail? _orderDetail;

  int? get id => _id;

  dynamic get productCode => _productCode;

  dynamic get invetoryTypeID => _invetoryTypeID;

  dynamic get formulationTypeID => _formulationTypeID;

  String? get productGenericName => _productGenericName;

  dynamic get purityPercentage => _purityPercentage;

  dynamic get measuringUnitID => _measuringUnitID;

  dynamic get weightPackSize => _weightPackSize;

  String? get remarks => _remarks;

  bool? get isVerified => _isVerified;

  bool? get isActive => _isActive;

  bool? get isFocused => _isFocused;

  int? get price => _price;

  String? get descriptions => _descriptions;

  int? get items => _items;

  int? get quantity => _quantity;

  int? get salesTax => _salesTax;

  int? get batchNumber => _batchNumber;

  int? get netAmount => _netAmount;

  String? get image => _image;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get categoryId => _categoryId;

  dynamic get measuringUnitId => _measuringUnitId;

  int? get policyId => _policyId;

  OrderDetail? get orderDetail => _orderDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['productCode'] = _productCode;
    map['invetoryTypeID'] = _invetoryTypeID;
    map['formulationTypeID'] = _formulationTypeID;
    map['productGenericName'] = _productGenericName;
    map['purityPercentage'] = _purityPercentage;
    map['measuringUnitID'] = _measuringUnitID;
    map['weightPackSize'] = _weightPackSize;
    map['remarks'] = _remarks;
    map['isVerified'] = _isVerified;
    map['isActive'] = _isActive;
    map['isFocused'] = _isFocused;
    map['price'] = _price;
    map['descriptions'] = _descriptions;
    map['items'] = _items;
    map['quantity'] = _quantity;
    map['salesTax'] = _salesTax;
    map['batchNumber'] = _batchNumber;
    map['netAmount'] = _netAmount;
    map['image'] = _image;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['categoryId'] = _categoryId;
    map['measuringUnitId'] = _measuringUnitId;
    map['policyId'] = _policyId;
    if (_orderDetail != null) {
      map['OrderDetail'] = _orderDetail?.toJson();
    }
    return map;
  }
}

class OrderDetail {
  OrderDetail({
    int? quantity,
    int? price,
    int? productId,
    int? orderId,
    String? createdAt,
    String? updatedAt,
  }) {
    _quantity = quantity;
    _price = price;
    _productId = productId;
    _orderId = orderId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  OrderDetail.fromJson(dynamic json) {
    _quantity = json['quantity'];
    _price = json['price'];
    _productId = json['productId'];
    _orderId = json['orderId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  int? _quantity;
  int? _price;
  int? _productId;
  int? _orderId;
  String? _createdAt;
  String? _updatedAt;

  int? get quantity => _quantity;

  int? get price => _price;

  int? get productId => _productId;

  int? get orderId => _orderId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['productId'] = _productId;
    map['orderId'] = _orderId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
