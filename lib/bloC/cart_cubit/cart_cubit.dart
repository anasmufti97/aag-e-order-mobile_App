import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/delete_cart_item_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/order_create_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/update_cart_item_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Repository _repository = Repository();

  Future getCartItems() async {
    emit(LoadingState());
    final data = {
      "userId": GetStorage().read('userId'),
    };

    final CartItemsApiResponse apiResponse = await _repository.cartItems(data);
    if (apiResponse.result == true) {
      emit(FetchedAllProducts(apiResponse.data, apiResponse.totalPrice));
    } else {
      emit(FailedToFetchedProduct(apiResponse.message ?? "Failed To Fetched Product"));
    }
  }

  Future<UpdateCartItemApiResponse> updateCartItem({required String itemId, required String quantity}) async {
    emit(LoadingState());
    final data = {
      "itemId": itemId,
      "quantity": quantity,
    };

    final UpdateCartItemApiResponse apiResponse = await _repository.updateCartItems(data);
    return apiResponse;
  }

  Future deleteCartItem({required String itemId}) async {
    emit(LoadingState());
    final data = {
      "itemId": itemId,
    };

    final DeleteCartItemApiResponse apiResponse = await _repository.deleteCartItem(data);
    if (apiResponse.result == true) {
      emit(DeleteProductSuccessfully(apiResponse.message ?? "Delete Item Successfully"));
    } else {
      emit(FailedToFetchedProduct(apiResponse.message ?? "Failed To Delete Item"));
    }
  }

  Future orderPlace({required var productsId}) async {
    emit(LoadingState());
    final _formData = {"zmId": 3, "prodcuts": productsId, "userId": GetStorage().read('userId'), "customerId": GetStorage().read('userId')};
    print(_formData);
    final OrderCreateApiResponse orderCreate = await _repository.orderCreate(_formData);
    if (orderCreate.data != null) {
      emit(OrderCreateSuccessfully("Order Create Successfully Order No : #000${orderCreate.data?.id}"));
    } else {
      emit(CreateOrderFailed(orderCreate.message ?? "Failed to Create Order"));
    }
  }
}
