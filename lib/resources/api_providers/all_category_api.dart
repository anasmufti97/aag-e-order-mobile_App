import 'package:aag_e_order_app/models/api_responses/add_category_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/all_category_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class AllCategoryApi {
  Future<AddCategoryApiResponse> addCategoryRequest(Map _formData) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.addCategoryApi,
        data: _formData,
      );
      if (response.statusCode == 200) {
        return AddCategoryApiResponse.fromJson(response.data);
      } else {
        return AddCategoryApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AddCategoryApiResponse.fromJson(e.response?.data);
      } else {
        return AddCategoryApiResponse(result: false);
      }
    }
  }

  Future<AllCategoryApiResponse> allCategory() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.listCategoryApi,
      );
      print(response.data);
      if (response.statusCode == 200) {
        return AllCategoryApiResponse.fromJson(response.data);
      } else {
        return AllCategoryApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllCategoryApiResponse.fromJson(e.response?.data);
      } else {
        return AllCategoryApiResponse(result: false);
      }
    }
  }

  Future<AllCategoryApiResponse> searchCategory(String name) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(ApiConstants.listCategoryApi, data: {"name": name});
      print(response.data);
      if (response.statusCode == 200) {
        return AllCategoryApiResponse.fromJson(response.data);
      } else {
        return AllCategoryApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllCategoryApiResponse.fromJson(e.response?.data);
      } else {
        return AllCategoryApiResponse(result: false);
      }
    }
  }
}
