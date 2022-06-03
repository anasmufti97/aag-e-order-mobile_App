import 'package:aag_e_order_app/models/api_responses/dashboard_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class DashboardGetApi {
  Future<DashboardApiResponse> getDashboardData(Map data) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.dashboard,
        data: data,
      );
      print(response.data);
      if (response.statusCode == 200) {
        return DashboardApiResponse.fromJson(response.data);
      } else {
        return DashboardApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return DashboardApiResponse.fromJson(e.response?.data);
      } else {
        return DashboardApiResponse(result: false);
      }
    }
  }
}
