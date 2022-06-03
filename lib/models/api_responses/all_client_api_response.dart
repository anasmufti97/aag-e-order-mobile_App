class AllClientApiResponse {
  AllClientApiResponse({
    bool? result,
    String? message,
    List<Client>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  AllClientApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Client.fromJson(v));
      });
    }
  }

  bool? _result;
  String? _message;
  List<Client>? _data;

  bool? get result => _result;

  String? get message => _message;

  List<Client>? get data => _data;
}

class Client {
  Client(
      {int? id,
      String? name,
      String? address,
      String? email,
      String? phone,
      String? region,
      String? shopChain,
      String? createdAt,
      String? updatedAt,
      dynamic userId}) {
    _id = id;
    _name = name;
    _address = address;
    _email = email;
    _phone = phone;
    _region = region;
    _shopChain = shopChain;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _userId = userId;
  }

  Client.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _email = json['email'];
    _phone = json['phone'];
    _region = json['region'];
    _shopChain = json['shopChain'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _userId = json['UserId'];
  }

  int? _id;
  String? _name;
  String? _address;
  String? _email;
  String? _phone;
  String? _region;
  String? _shopChain;
  String? _createdAt;
  String? _updatedAt;
  dynamic _userId;

  int? get id => _id;

  String? get name => _name;

  String? get address => _address;

  String? get email => _email;

  String? get phone => _phone;

  String? get region => _region;

  String? get shopChain => _shopChain;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  dynamic get userId => _userId;
}
