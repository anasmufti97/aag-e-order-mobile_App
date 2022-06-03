import 'package:aag_e_order_app/models/api_responses/add_client_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/all_client_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/client_detail_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class AllClientApi {
  Future<AddClientApiResponse> addClientRequest(Map _formData) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.addClientApi,
        data: _formData,
      );
      if (response.statusCode == 200) {
        return AddClientApiResponse.fromJson(response.data);
      } else {
        return AddClientApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return AddClientApiResponse.fromJson(e.response?.data);
      } else {
        return AddClientApiResponse(result: false);
      }
    }
  }

  Future<AllClientApiResponse> allClient() async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.listClientApi,
      );
      print(response.data);
      if (response.statusCode == 200) {
        return AllClientApiResponse.fromJson(response.data);
      } else {
        return AllClientApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllClientApiResponse.fromJson(e.response?.data);
      } else {
        return AllClientApiResponse(result: false);
      }
    }
  }

  Future<ClientDetailApiResponse> detailClientRequest(id) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        ApiConstants.detailClientApi + id.toString(),
      );
      if (response.statusCode == 200) {
        return ClientDetailApiResponse.fromJson(response.data);
      } else {
        return ClientDetailApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return ClientDetailApiResponse.fromJson(e.response?.data);
      } else {
        return ClientDetailApiResponse(result: false);
      }
    }
  }

  Future<AllClientApiResponse> searchClient(String name) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(ApiConstants.listClientApi, data: {"name": name});
      print(response.data);
      if (response.statusCode == 200) {
        return AllClientApiResponse.fromJson(response.data);
      } else {
        return AllClientApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllClientApiResponse.fromJson(e.response?.data);
      } else {
        return AllClientApiResponse(result: false);
      }
    }
  }
}
