class AllPolicyApiResponse {
  AllPolicyApiResponse({
    bool? result,
    String? message,
    List<Policy>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  AllPolicyApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Policy.fromJson(v));
      });
    }
  }

  bool? _result;
  String? _message;
  List<Policy>? _data;

  bool? get result => _result;

  String? get message => _message;

  List<Policy>? get data => _data;

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

class Policy {
  Policy({
    int? id,
    String? name,
    int? price,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _price = price;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Policy.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  int? _id;
  String? _name;
  int? _price;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  String? get name => _name;

  int? get price => _price;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
