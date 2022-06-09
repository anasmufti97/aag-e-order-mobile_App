import 'dart:convert';
import 'dart:developer';

import 'package:aag_e_order_app/models/api_responses/all_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/product_detail_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Future<AllProductApiResponse> allProducts(Map data) async {
    try {
      var url = Uri.parse(ApiConstants.allProductsApi);
      var response = await http.post(
        url,
        body: data,
      );
      if (response.statusCode == 200) {
        var decod = json.decode(response.body.toString().replaceAll("\n", ""));
        log('jsonify --> ${decod}');
        // print('length of policy balances --> ${decod['data'].length}');
        var decodeData = json.decode(decod.toString());
        return AllProductApiResponse.fromJson(decodeData);
      } else {
        return AllProductApiResponse(result: false);
      }
    } catch (e) {

      print('e' +e.toString());
      // if (e is httpError) {
      //   print(e.response?.data);
      //   return SignInApiResponse.fromJson(e.response?.data);
      // } else {
      return AllProductApiResponse(result: false);
    }
  }

  // Future<ProductDetailApiResponse> productDetailRequest(id) async {
  //   try {
  //     final Dio dio = Dio();
  //     final Response response = await dio.get(
  //       ApiConstants.productDetailApi + id.toString(),
  //     );
  //     if (response.statusCode == 200) {
  //       return ProductDetailApiResponse.fromJson(response.data);
  //     } else {
  //       return ProductDetailApiResponse(result: false);
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       return ProductDetailApiResponse.fromJson(e.response?.data);
  //     } else {
  //       return ProductDetailApiResponse(result: false);
  //     }
  //   }
  // }
  //
  // Future<AllProductApiResponse> searchProducts(id, String name) async {
  //   try {
  //     final Dio dio = Dio();
  //     final Response response = await dio.post(ApiConstants.allProductsApi, data: {"categoryId": id, "name": name});
  //     print(response.data);
  //     if (response.statusCode == 200) {
  //       return AllProductApiResponse.fromJson(response.data);
  //     } else {
  //       return AllProductApiResponse(result: false);
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       print(e.response?.data);
  //       return AllProductApiResponse.fromJson(e.response?.data);
  //     } else {
  //       return AllProductApiResponse(result: false);
  //     }
  //   }
  // }
}
