class User {
  User({
    int? id,
    String? fullName,
    String? email,
    String? password,
    String? address,
    int? zmId,
    String? createdAt,
    String? updatedAt,
    String? role,
    String? token,
  }) {
    _id = id;
    _fullName = fullName;
    _email = email;
    _password = password;
    _address = address;
    _zmId = zmId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _role = role;
    _token = token;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['fullName'];
    _email = json['email'];
    _password = json['password'];
    _address = json['address'];
    _zmId = json['zmId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _role = json['role'];
    _token = json['token'];
  }

  int? _id;
  String? _fullName;
  String? _email;
  String? _password;
  String? _address;
  int? _zmId;
  String? _createdAt;
  String? _updatedAt;
  String? _role;
  String? _token;

  int? get id => _id;

  String? get fullName => _fullName;

  String? get email => _email;

  String? get password => _password;

  String? get address => _address;

  int? get zmId => _zmId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get role => _role;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['password'] = _password;
    map['address'] = _address;
    map['zmId'] = _zmId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['role'] = _role;
    map['token'] = _token;
    return map;
  }
}
