import 'package:aag_e_order_app/models/model/category.dart';

class Product {
  Product({
    int? id,
    String? productCode,
    int? invetoryTypeID,
    int? formulationTypeID,
    String? productGenericName,
    String? purityPercentage,
    int? measuringUnitID,
    int? weightPackSize,
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
    int? measuringUnitId,
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
  String? _productCode;
  int? _invetoryTypeID;
  int? _formulationTypeID;
  String? _productGenericName;
  String? _purityPercentage;
  int? _measuringUnitID;
  int? _weightPackSize;
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
  int? _measuringUnitId;
  int? _policyId;
  Category? _category;

  int? get id => _id;

  String? get productCode => _productCode;

  int? get invetoryTypeID => _invetoryTypeID;

  int? get formulationTypeID => _formulationTypeID;

  String? get productGenericName => _productGenericName;

  String? get purityPercentage => _purityPercentage;

  int? get measuringUnitID => _measuringUnitID;

  int? get weightPackSize => _weightPackSize;

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

  int? get measuringUnitId => _measuringUnitId;

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
