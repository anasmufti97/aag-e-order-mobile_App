import 'package:aag_e_order_app/models/api_responses/all_policy_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class PolicyApi {
  Future<AllPolicyApiResponse> allPolicy() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        ApiConstants.policyList,
      );
      print(response.data);
      if (response.statusCode == 200) {
        return AllPolicyApiResponse.fromJson(response.data);
      } else {
        return AllPolicyApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllPolicyApiResponse.fromJson(e.response?.data);
      } else {
        return AllPolicyApiResponse(result: false);
      }
    }
  }
}
