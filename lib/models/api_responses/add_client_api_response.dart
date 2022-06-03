class AddClientApiResponse {
  AddClientApiResponse({
    bool? result,
    String? message,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  AddClientApiResponse.fromJson(dynamic json) {
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
    String? name,
    String? address,
    String? email,
    String? phone,
    String? region,
    String? shopChain,
    String? updatedAt,
    String? createdAt,
  }) {
    _id = id;
    _name = name;
    _address = address;
    _email = email;
    _phone = phone;
    _region = region;
    _shopChain = shopChain;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _email = json['email'];
    _phone = json['phone'];
    _region = json['region'];
    _shopChain = json['shopChain'];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
  }

  int? _id;
  String? _name;
  String? _address;
  String? _email;
  String? _phone;
  String? _region;
  String? _shopChain;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;

  String? get name => _name;

  String? get address => _address;

  String? get email => _email;

  String? get phone => _phone;

  String? get region => _region;

  String? get shopChain => _shopChain;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    map['email'] = _email;
    map['phone'] = _phone;
    map['region'] = _region;
    map['shopChain'] = _shopChain;
    map['updatedAt'] = _updatedAt;
    map['createdAt'] = _createdAt;
    return map;
  }
}
