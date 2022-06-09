class SignInApiResponse {
  SignInApiResponse({
      String? status,
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  SignInApiResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  String? userName;
  List<Data>? _data;

  String? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      String? fullName,
      String? password,
      String? address,
      String? email,
      String? phone,
      String? region,
      String? territory,
      String? zone,
      String? role,}){
    _fullName = fullName;
    _password = password;
    _address = address;
    _email = email;
    _phone = phone;
    _region = region;
    _territory = territory;
    _zone = zone;
    _role = role;
}

  Data.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _password = json['password'];
    _address = json['address'];
    _email = json['email'];
    _phone = json['phone'];
    _region = json['region'];
    _territory = json['territory'];
    _zone = json['zone'];
    _role = json['role'];
  }
  String? _fullName;
  String? _password;
  String? _address;
  String? _email;
  String? _phone;
  String? _region;
  String? _territory;
  String? _zone;
  String? _role;

  String? get fullName => _fullName;
  String? get password => _password;
  String? get address => _address;
  String? get email => _email;
  String? get phone => _phone;
  String? get region => _region;
  String? get territory => _territory;
  String? get zone => _zone;
  String? get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['password'] = _password;
    map['address'] = _address;
    map['email'] = _email;
    map['phone'] = _phone;
    map['region'] = _region;
    map['territory'] = _territory;
    map['zone'] = _zone;
    map['role'] = _role;
    return map;
  }

}