import 'package:aag_e_order_app/models/api_responses/add_to_cart_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/delete_cart_item_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_cart_item_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class AddToCartApi {
  Future<AddToCartApiResponse> addToCart(Map _formData) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.addToCart,
        data: _formData,
      );

      if (response.statusCode == 200) {
        print(response.data);
        return AddToCartApiResponse.fromJson(response.data);
      } else {
        return AddToCartApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AddToCartApiResponse.fromJson(e.response?.data);
      } else {
        return AddToCartApiResponse(result: false);
      }
    }
  }

  Future<CartItemsApiResponse> getCartItems(Map _formData) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(ApiConstants.cartItems, data: _formData);
      if (response.statusCode == 200) {
        print(response.data);
        return CartItemsApiResponse.fromJson(response.data);
      } else {
        return CartItemsApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return CartItemsApiResponse.fromJson(e.response?.data);
      } else {
        return CartItemsApiResponse(result: false);
      }
    }
  }

  Future<UpdateCartItemApiResponse> updateCartItems(Map _formData) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(ApiConstants.changeQuantity, data: _formData);
      print("\n\n\n\n");
      print(response.data);
      print("\n\n\n\n");
      if (response.statusCode == 200) {
        print("\n\n\n\n");
        print(response.data);
        print("\n\n\n\n");
        return UpdateCartItemApiResponse.fromJson(response.data);
      } else {
        return UpdateCartItemApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print("\n\n\n\n");
        print(e.response?.data);
        print("\n\n\n\n");
        print(e.response?.data);
        return UpdateCartItemApiResponse.fromJson(e.response?.data);
      } else {
        return UpdateCartItemApiResponse(result: false);
      }
    }
  }

  Future<DeleteCartItemApiResponse> deleteCartItems(Map _formData) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.delete(ApiConstants.deleteCartItem, data: _formData);
      if (response.statusCode == 200) {
        print(response.data);
        return DeleteCartItemApiResponse.fromJson(response.data);
      } else {
        return DeleteCartItemApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return DeleteCartItemApiResponse.fromJson(e.response?.data);
      } else {
        return DeleteCartItemApiResponse(result: false);
      }
    }
  }
}
