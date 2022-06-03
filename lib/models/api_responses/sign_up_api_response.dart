class SignUpApiResponse {
  SignUpApiResponse({
    bool? result,
    User? data,
    String? message,
  }) {
    _result = result;
    _data = data;
    _message = message;
  }

  SignUpApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _data = json['data'] != null ? User.fromJson(json['data']) : null;
    _message = json['message'];
  }

  bool? _result;
  User? _data;
  String? _message;

  bool? get result => _result;

  User? get data => _data;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

class User {
  User({
    int? id,
    String? email,
    String? fullName,
    String? telephones,
    String? address,
    String? role,
    String? updatedAt,
    String? createdAt,
    String? token,
  }) {
    _id = id;
    _email = email;
    _fullName = fullName;
    _telephones = telephones;
    _address = address;
    _role = role;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _token = token;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _fullName = json['fullName'];
    _telephones = json['telephones'];
    _address = json['address'];
    _role = json['role'];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
    _token = json['token'];
  }

  int? _id;
  String? _email;
  String? _fullName;
  String? _telephones;
  String? _address;
  String? _role;
  String? _updatedAt;
  String? _createdAt;
  String? _token;

  int? get id => _id;

  String? get email => _email;

  String? get fullName => _fullName;

  String? get telephones => _telephones;

  String? get address => _address;

  String? get role => _role;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['fullName'] = _fullName;
    map['telephones'] = _telephones;
    map['address'] = _address;
    map['role'] = _role;
    map['updatedAt'] = _updatedAt;
    map['createdAt'] = _createdAt;
    map['token'] = _token;
    return map;
  }
}
