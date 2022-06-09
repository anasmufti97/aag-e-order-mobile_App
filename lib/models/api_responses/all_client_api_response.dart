class AllClientApiResponse {
  AllClientApiResponse({
      bool? result, 
      List<Data>? data,}){
    _result = result;
    _data = data;
}

  AllClientApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _result;
  List<Data>? _data;

  bool? get result => _result;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      String? customerAccount, 
      String? name, 
      String? address, 
      String? phone, 
      String? email, 
      String? fax,}){
    _customerAccount = customerAccount;
    _name = name;
    _address = address;
    _phone = phone;
    _email = email;
    _fax = fax;
}

  Data.fromJson(dynamic json) {
    _customerAccount = json['customerAccount'];
    _name = json['name'];
    _address = json['address'];
    _phone = json['phone'];
    _email = json['email'];
    _fax = json['fax'];
  }
  String? _customerAccount;
  String? _name;
  String? _address;
  String? _phone;
  String? _email;
  String? _fax;

  String? get customerAccount => _customerAccount;
  String? get name => _name;
  String? get address => _address;
  String? get phone => _phone;
  String? get email => _email;
  String? get fax => _fax;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerAccount'] = _customerAccount;
    map['name'] = _name;
    map['address'] = _address;
    map['phone'] = _phone;
    map['email'] = _email;
    map['fax'] = _fax;
    return map;
  }

}