import 'package:aag_e_order_app/models/model/user.dart';

class GetUserApiResponse {
  GetUserApiResponse({
    bool? result,
    String? message,
    User? data,
  }) {
    _result = result;
    _message = message;
    _data = data;
  }

  GetUserApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    _data = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  bool? _result;
  String? _message;
  User? _data;

  bool? get result => _result;

  String? get message => _message;

  User? get data => _data;
}
