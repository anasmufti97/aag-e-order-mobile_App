import 'package:aag_e_order_app/models/api_responses/get_user_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class UserGetApi {
  Future<GetUserApiResponse> getUser(Map data) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(ApiConstants.user, data: data);
      if (response.statusCode == 200) {
        return GetUserApiResponse.fromJson(response.data);
      } else {
        return GetUserApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return GetUserApiResponse.fromJson(e.response?.data);
      } else {
        return GetUserApiResponse(result: false);
      }
    }
  }
}
