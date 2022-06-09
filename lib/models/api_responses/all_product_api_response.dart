class AllProductApiResponse {
  AllProductApiResponse({
      bool? result, 
      List<Data>? data,}){
    _result = result;
    _data = data;
}

  AllProductApiResponse.fromJson(dynamic json) {
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
      String? itemNumber, 
      String? itemName,}){
    _itemNumber = itemNumber;
    _itemName = itemName;
}

  Data.fromJson(dynamic json) {
    _itemNumber = json['itemNumber'];
    _itemName = json['itemName'];
  }
  String? _itemNumber;
  String? _itemName;

  String? get itemNumber => _itemNumber;
  String? get itemName => _itemName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemNumber'] = _itemNumber;
    map['itemName'] = _itemName;
    return map;
  }

}