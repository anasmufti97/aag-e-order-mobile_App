class OrderCreateApiResponse {
  OrderCreateApiResponse({
      bool? result, 
      String? message, 
      Data? data,}){
    _result = result;
    _message = message;
    _data = data;
}

  OrderCreateApiResponse.fromJson(dynamic json) {
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
      int? zmId, 
      int? customerId, 
      String? status, 
      String? updatedAt, 
      String? createdAt,}){
    _id = id;
    _zmId = zmId;
    _customerId = customerId;
    _status = status;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _zmId = json['zmId'];
    // _customerId = json['customerId'];
    // _status = json['status'];
    _updatedAt = json['updatedAt'];
    _createdAt = json['createdAt'];
  }
  int? _id;
  int? _zmId;
  int? _customerId;
  String? _status;
  String? _updatedAt;
  String? _createdAt;

  int? get id => _id;
  int? get zmId => _zmId;
  int? get customerId => _customerId;
  String? get status => _status;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['zmId'] = _zmId;
    map['customerId'] = _customerId;
    map['status'] = _status;
    map['updatedAt'] = _updatedAt;
    map['createdAt'] = _createdAt;
    return map;
  }

}