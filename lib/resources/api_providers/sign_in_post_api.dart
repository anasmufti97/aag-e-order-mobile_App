
import 'dart:convert';

import 'package:aag_e_order_app/models/api_responses/sign_in_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class SignInPostApi {
  Future<SignInApiResponse> signInRequest(Map _formData) async {
    try {
      var url = Uri.parse(ApiConstants.login);
       var response = await http.post(
         url,
        body: _formData,
      );
      // var data = json.encode(response.data);
      // print(json.encode(response.data));

      print("\n\n\n\n");
      print(response.body);
      print("\n\n\n\n");
      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());
        var decodeData = json.decode(data.toString());
        print(data);
        print(decodeData);
        return SignInApiResponse.fromJson(decodeData);
      } else {
        return SignInApiResponse(status: "fail");
      }
    } catch (e) {
      // if (e is httpError) {
      //   print(e.response?.data);
      //   return SignInApiResponse.fromJson(e.response?.data);
      // } else {
        return SignInApiResponse(status: "fail");
      }
    // }
  }
}
