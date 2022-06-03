import 'package:aag_e_order_app/models/api_responses/add_order_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/all_order_list_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/delete_order_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/order_create_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/order_detail_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_order_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_order_status_api_response.dart';
import 'package:aag_e_order_app/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';

class OrderApi {
  Future<OrderCreateApiResponse> placeOrder(Map data) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.orderCreate,
        data: data,
      );
      print(response.data);
      if (response.statusCode == 200) {
        return OrderCreateApiResponse.fromJson(response.data);
      } else {
        return OrderCreateApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return OrderCreateApiResponse.fromJson(e.response?.data);
      } else {
        return OrderCreateApiResponse(result: false);
      }
    }
  }


  Future<AllOrderListApiResponse> allOrder(Map data) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.allOrderList,
        data: data,
      );
      print(response.data);
      if (response.statusCode == 200) {
        return AllOrderListApiResponse.fromJson(response.data);
      } else {
        return AllOrderListApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllOrderListApiResponse.fromJson(e.response?.data);
      } else {
        return AllOrderListApiResponse(result: false);
      }
    }
  }

  Future<OrderDetailApiResponse> orderDetail(id) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.get(
        ApiConstants.orderDetail + id.toString(),
      );
      if (response.statusCode == 200) {
        return OrderDetailApiResponse.fromJson(response.data);
      } else {
        return OrderDetailApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        return OrderDetailApiResponse.fromJson(e.response?.data);
      } else {
        return OrderDetailApiResponse(result: false);
      }
    }
  }

  Future<UpdateOrderStatusApiResponse> orderStatusChange(Map map) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(ApiConstants.statusChange, data: map);
      print(response.data);
      if (response.statusCode == 200) {
        return UpdateOrderStatusApiResponse.fromJson(response.data);
      } else {
        return UpdateOrderStatusApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return UpdateOrderStatusApiResponse.fromJson(e.response?.data);
      } else {
        return UpdateOrderStatusApiResponse(result: false);
      }
    }
  }

  Future<AllOrderListApiResponse> searchOrder(Map data) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.allOrderList,
        data: data,
      );
      if (response.statusCode == 200) {
        print(response.data);
        return AllOrderListApiResponse.fromJson(response.data);
      } else {
        return AllOrderListApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AllOrderListApiResponse.fromJson(e.response?.data);
      } else {
        return AllOrderListApiResponse(result: false);
      }
    }
  }

  Future<UpdateOrderApiResponse> updateOrder(Map data) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.updateOrder,
        data: data,
      );
      if (response.statusCode == 200) {
        print(response.data);
        return UpdateOrderApiResponse.fromJson(response.data);
      } else {
        return UpdateOrderApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return UpdateOrderApiResponse.fromJson(e.response?.data);
      } else {
        return UpdateOrderApiResponse(result: false);
      }
    }
  }

  Future<AddOrderProductApiResponse> addOrderProduct(Map data) async {
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.addOrderProduct,
        data: data,
      );
      if (response.statusCode == 200) {
        print(response.data);
        return AddOrderProductApiResponse.fromJson(response.data);
      } else {
        return AddOrderProductApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return AddOrderProductApiResponse.fromJson(e.response?.data);
      } else {
        return AddOrderProductApiResponse(result: false);
      }
    }
  }

  Future<DeleteOrderProductApiResponse> deleteOrderProduct(Map data) async {
    print(data);
    print(data);
    print(data);
    try {
      final Dio dio = Dio();
      final Response response = await dio.post(
        ApiConstants.deleteOrderProduct,
        data: data,
      );
      print(response.data);
      if (response.statusCode == 200) {
        print(response.data);
        return DeleteOrderProductApiResponse.fromJson(response.data);
      } else {
        return DeleteOrderProductApiResponse(result: false);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.response?.data);
        return DeleteOrderProductApiResponse.fromJson(e.response?.data);
      } else {
        return DeleteOrderProductApiResponse(result: false);
      }
    }
  }
}
