class SignInApiResponse {
  SignInApiResponse({
      String? status, 
      String? fullName, 
      String? password, 
      String? address, 
      String? email, 
      String? phone, 
      String? region, 
      String? territory, 
      String? zone, 
      String? role,}){
    _status = status;
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

  SignInApiResponse.fromJson(dynamic json) {
    _status = json['status'];
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
  String? _status;
  String? _fullName;
  String? _password;
  String? _address;
  String? _email;
  String? _phone;
  String? _region;
  String? _territory;
  String? _zone;
  String? _role;

  String? get status => _status;
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
    map['status'] = _status;
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