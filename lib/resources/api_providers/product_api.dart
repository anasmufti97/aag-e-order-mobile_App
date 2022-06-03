import 'package:aag_e_order_app/models/api_responses/all_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/product_detail_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ProductApi {
  Future<AllProductApiResponse> allProducts(id) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(ApiConstants.allProductsApi, data: {"categoryId": id});
      print(response.data);
      if (response.statusCode == 200) {
        return AllProductApiResponse.fromJson(response.data);
      } else {
        return AllProductApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllProductApiResponse.fromJson(e.response?.data);
      } else {
        return AllProductApiResponse(result: false);
      }
    }
  }

  Future<ProductDetailApiResponse> productDetailRequest(id) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        ApiConstants.productDetailApi + id.toString(),
      );
      if (response.statusCode == 200) {
        return ProductDetailApiResponse.fromJson(response.data);
      } else {
        return ProductDetailApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return ProductDetailApiResponse.fromJson(e.response?.data);
      } else {
        return ProductDetailApiResponse(result: false);
      }
    }
  }

  Future<AllProductApiResponse> searchProducts(id, String name) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(ApiConstants.allProductsApi, data: {"categoryId": id, "name": name});
      print(response.data);
      if (response.statusCode == 200) {
        return AllProductApiResponse.fromJson(response.data);
      } else {
        return AllProductApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllProductApiResponse.fromJson(e.response?.data);
      } else {
        return AllProductApiResponse(result: false);
      }
    }
  }
}
