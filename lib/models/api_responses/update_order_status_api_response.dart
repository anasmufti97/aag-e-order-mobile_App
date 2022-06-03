class UpdateOrderStatusApiResponse {
  UpdateOrderStatusApiResponse({
    bool? result,
    String? message,
    Data? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  UpdateOrderStatusApiResponse.fromJson(dynamic json) {
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
    String? status,
    dynamic invoiceNumber,
    String? createdAt,
    String? updatedAt,
    int? customerId,
    int? zmId,
  }) {
    _id = id;
    _status = status;
    _invoiceNumber = invoiceNumber;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _customerId = customerId;
    _zmId = zmId;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _invoiceNumber = json['invoiceNumber'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _customerId = json['customerId'];
    _zmId = json['zmId'];
  }

  int? _id;
  String? _status;
  dynamic _invoiceNumber;
  String? _createdAt;
  String? _updatedAt;
  int? _customerId;
  int? _zmId;

  int? get id => _id;

  String? get status => _status;

  dynamic get invoiceNumber => _invoiceNumber;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get customerId => _customerId;

  int? get zmId => _zmId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['invoiceNumber'] = _invoiceNumber;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['customerId'] = _customerId;
    map['zmId'] = _zmId;
    return map;
  }
}
