class DashboardApiResponse {
  DashboardApiResponse({
    bool? result,
    String? message,
    DashboardData? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  DashboardApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _data = json['data'] != null ? DashboardData.fromJson(json['data']) : null;
  }

  bool? _result;
  String? _message;
  DashboardData? _data;

  bool? get result => _result;

  String? get message => _message;

  DashboardData? get data => _data;

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

class DashboardData {
  DashboardData({
    Cancelledstatus? cancelledstatus,
    Confirmedstatus? confirmedstatus,
    Deliveredstatus? deliveredstatus,
    Pendingstatus? pendingstatus,
    SendBackTostatus? sendBackTostatus,
    int? products,
    int? clients,
  }) {
    _cancelledstatus = cancelledstatus;
    _confirmedstatus = confirmedstatus;
    _deliveredstatus = deliveredstatus;
    _pendingstatus = pendingstatus;
    _sendBackTostatus = sendBackTostatus;
    _products = products;
    _clients = clients;
  }

  DashboardData.fromJson(dynamic json) {
    _cancelledstatus = json['cancelledstatus'] != null ? Cancelledstatus.fromJson(json['cancelledstatus']) : null;
    _confirmedstatus = json['confirmedstatus'] != null ? Confirmedstatus.fromJson(json['confirmedstatus']) : null;
    _deliveredstatus = json['deliveredstatus'] != null ? Deliveredstatus.fromJson(json['deliveredstatus']) : null;
    _pendingstatus = json['pendingstatus'] != null ? Pendingstatus.fromJson(json['pendingstatus']) : null;
    _sendBackTostatus = json['sendBackTostatus'] != null ? SendBackTostatus.fromJson(json['sendBackTostatus']) : null;
    _products = json['products'];
    _clients = json['clients'];
  }

  Cancelledstatus? _cancelledstatus;
  Confirmedstatus? _confirmedstatus;
  Deliveredstatus? _deliveredstatus;
  Pendingstatus? _pendingstatus;
  SendBackTostatus? _sendBackTostatus;
  int? _products;
  int? _clients;

  Cancelledstatus? get cancelledstatus => _cancelledstatus;

  Confirmedstatus? get confirmedstatus => _confirmedstatus;

  Deliveredstatus? get deliveredstatus => _deliveredstatus;

  Pendingstatus? get pendingstatus => _pendingstatus;

  SendBackTostatus? get sendBackTostatus => _sendBackTostatus;

  int? get products => _products;

  int? get clients => _clients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cancelledstatus != null) {
      map['cancelledstatus'] = _cancelledstatus?.toJson();
    }
    if (_confirmedstatus != null) {
      map['confirmedstatus'] = _confirmedstatus?.toJson();
    }
    if (_deliveredstatus != null) {
      map['deliveredstatus'] = _deliveredstatus?.toJson();
    }
    if (_pendingstatus != null) {
      map['pendingstatus'] = _pendingstatus?.toJson();
    }
    if (_sendBackTostatus != null) {
      map['sendBackTostatus'] = _sendBackTostatus?.toJson();
    }
    map['products'] = _products;
    map['clients'] = _clients;
    return map;
  }
}

class SendBackTostatus {
  SendBackTostatus({
    String? status,
    int? count,
  }) {
    _status = status;
    _count = count;
  }

  SendBackTostatus.fromJson(dynamic json) {
    _status = json['status'];
    _count = json['count'];
  }

  String? _status;
  int? _count;

  String? get status => _status;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['count'] = _count;
    return map;
  }
}

class Pendingstatus {
  Pendingstatus({
    String? status,
    int? count,
  }) {
    _status = status;
    _count = count;
  }

  Pendingstatus.fromJson(dynamic json) {
    _status = json['status'];
    _count = json['count'];
  }

  String? _status;
  int? _count;

  String? get status => _status;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['count'] = _count;
    return map;
  }
}

class Deliveredstatus {
  Deliveredstatus({
    String? status,
    int? count,
  }) {
    _status = status;
    _count = count;
  }

  Deliveredstatus.fromJson(dynamic json) {
    _status = json['status'];
    _count = json['count'];
  }

  String? _status;
  int? _count;

  String? get status => _status;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['count'] = _count;
    return map;
  }
}

class Confirmedstatus {
  Confirmedstatus({
    String? status,
    int? count,
  }) {
    _status = status;
    _count = count;
  }

  Confirmedstatus.fromJson(dynamic json) {
    _status = json['status'];
    _count = json['count'];
  }

  String? _status;
  int? _count;

  String? get status => _status;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['count'] = _count;
    return map;
  }
}

class Cancelledstatus {
  Cancelledstatus({
    String? status,
    int? count,
  }) {
    _status = status;
    _count = count;
  }

  Cancelledstatus.fromJson(dynamic json) {
    _status = json['status'];
    _count = json['count'];
  }

  String? _status;
  int? _count;

  String? get status => _status;

  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['count'] = _count;
    return map;
  }
}
