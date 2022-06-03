import 'package:aag_e_order_app/models/model/product.dart';

class AllProductApiResponse {
  AllProductApiResponse({
    bool? result,
    String? message,
    List<Product>? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  AllProductApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Product.fromJson(v));
      });
    }
  }

  bool? _result;
  String? _message;
  List<Product>? _data;

  bool? get result => _result;

  String? get message => _message;

  List<Product>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
