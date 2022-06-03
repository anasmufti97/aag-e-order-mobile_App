import 'package:aag_e_order_app/models/api_responses/delete_order_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/order_detail_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_order_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_order_status_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'order_detail_state.dart';

class OrderDetailCubit extends Cubit<OrderDetailState> {
  OrderDetailCubit() : super(OrderDetailInitial());

  final Repository _repository = Repository();

  Future orderData({
    required String id,
  }) async {
    emit(LoadingState());

    final OrderDetailApiResponse apiResponse = await _repository.orderDetail(id);
    if (apiResponse.result == true) {
      emit(OrderDataFetchedSuccessfully(apiResponse.data!, apiResponse.totalPrice));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Add Client Failed"));
    }
  }

  Future orderStatusChange({required String id, required String status}) async {
    emit(LoadingState());
    final _formData = {
      'orderId': id,
      'status': status,
    };
    final UpdateOrderStatusApiResponse apiResponse = await _repository.orderStatus(_formData);
    if (apiResponse.result == true) {
      emit(OrderStatusChangeSuccessfully(apiResponse.message ?? "Order Status Successfully"));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Order Status Failed"));
    }
  }

  Future updateOrder({required String id, required List productList}) async {
    emit(LoadingState());
    var _formData;
    if (GetStorage().read('role') == "TM") {
      _formData = {
        "orderId": id,
        "products": productList,
        "status": "pending",
      };
      print(" Form Data $_formData");
    }
    final UpdateOrderApiResponse apiResponse = await _repository.updateOrder(_formData);
    if (apiResponse.result == true) {
      emit(OrderStatusChangeSuccessfully(apiResponse.message ?? "Order Status Successfully"));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Failed To Update Order"));
    }
  }

  Future<void> deleteOrderProduct({required int productId, required int orderId}) async {
    print(orderId);
    print(productId);
    emit(LoadingState());
    final _formData = {'orderId': orderId, 'productId': productId};
    print(_formData);
    final DeleteOrderProductApiResponse addProduct = await _repository.deleteOrderProduct(_formData);
    if (addProduct.result == true) {
      emit(DeleteOrderProductSuccessfully(addProduct.message ?? "Product Product Successfully"));
    } else {
      emit(FailedToDeleteOrderProduct(addProduct.message ?? "Failed Delete Product"));
    }
  }
}
