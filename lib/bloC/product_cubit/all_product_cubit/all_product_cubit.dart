import 'package:aag_e_order_app/models/api_responses/all_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/models/model/product.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit() : super(AllProductInitial());

  final Repository _repository = Repository();

  Future allProduct({required String id}) async {
    emit(LoadingState());
    final AllProductApiResponse apiResponse = await _repository.allProduct(id);
    if (apiResponse.result == true) {
      emit(AllProductsFetchedSuccessfully(apiResponse.data));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Add Client Failed"));
    }
  }

  Future getCartItems() async {
    emit(LoadingState());
    final data = {
      "userId": GetStorage().read('userId'),
    };

    final CartItemsApiResponse apiResponse = await _repository.cartItems(data);
    if (apiResponse.result == true) {
      emit(GetCartItemSuccessfully(apiResponse.data));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Failed To Fetched Product"));
    }
  }

  Future searchProduct({required String id, required String name}) async {
    emit(LoadingState());
    final AllProductApiResponse apiResponse = await _repository.searchProduct(id, name);
    if (apiResponse.result == true) {
      emit(AllProductsFetchedSuccessfully(apiResponse.data));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "No Products Found"));
    }
  }
}
