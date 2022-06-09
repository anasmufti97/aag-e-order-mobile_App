class AllPolicyApiResponse {
  AllPolicyApiResponse({
      bool? result, 
      List<Data>? data,}){
    _result = result;
    _data = data;
}

  AllPolicyApiResponse.fromJson(dynamic json) {
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
      String? policyCode, 
      String? policyDescription, 
      String? policyBalance,}){
    _policyCode = policyCode;
    _policyDescription = policyDescription;
    _policyBalance = policyBalance;
}

  Data.fromJson(dynamic json) {
    _policyCode = json['policyCode'];
    _policyDescription = json['policyDescription'];
    _policyBalance = json['policyBalance'];
  }
  String? _policyCode;
  String? _policyDescription;
  String? _policyBalance;

  String? get policyCode => _policyCode;
  String? get policyDescription => _policyDescription;
  String? get policyBalance => _policyBalance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['policyCode'] = _policyCode;
    map['policyDescription'] = _policyDescription;
    map['policyBalance'] = _policyBalance;
    return map;
  }

}