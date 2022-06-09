import 'dart:convert';
import 'dart:developer';

import 'package:aag_e_order_app/models/api_responses/all_policy_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class PolicyApi {
  Future<AllPolicyApiResponse> allPolicy(Map data) async {
    try {
      var url = Uri.parse(ApiConstants.policyList);
      var response = await http.post(
        url,
        body: data,
      );
      if (response.statusCode == 200) {
        var decod = json.decode(response.body.toString());
        log('jsonify --> ${decod}');
        // print('length of policy balances --> ${decod['data'].length}');
        var decodeData = json.decode(decod.toString());
        print("\n\n\n");
        print(decodeData);
        print("\n\n\n");
        return AllPolicyApiResponse.fromJson(decodeData);
      } else {
        return AllPolicyApiResponse(result: false);
      }
    } catch (e) {

      print('e' +e.toString());
      // if (e is httpError) {
      //   print(e.response?.data);
      //   return SignInApiResponse.fromJson(e.response?.data);
      // } else {
      return AllPolicyApiResponse(result: false);
    }
  }
}
