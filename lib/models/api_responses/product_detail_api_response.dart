class ProductDetailApiResponse {
  ProductDetailApiResponse({
    bool? result,
    String? message,
    Product? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  ProductDetailApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _data = json['data'] != null ? Product.fromJson(json['data']) : null;
  }

  bool? _result;
  String? _message;
  Product? _data;

  bool? get result => _result;

  String? get message => _message;

  Product? get data => _data;

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

class Product {
  Product({
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
    Category? category,
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
    _category = category;
  }

  Product.fromJson(dynamic json) {
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
    _category = json['Category'] != null ? Category.fromJson(json['Category']) : null;
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
  Category? _category;

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

  Category? get category => _category;

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
    if (_category != null) {
      map['Category'] = _category?.toJson();
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
