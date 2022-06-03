import 'package:aag_e_order_app/models/api_responses/add_order_product_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/add_to_cart_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/product_detail_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailInitial());

  final Repository _repository = Repository();

  Future productDetail({
    required String id,
  }) async {
    emit(LoadingState());
    final ProductDetailApiResponse apiResponse = await _repository.productDetail(id);
    if (apiResponse.result == true) {
      emit(ProductDetailFetchedSuccessfully(apiResponse.data!));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Failed To Fetched Data"));
    }
  }

  Future<void> addToCart({required String productId, required String quantity}) async {
    emit(LoadingState());
    final _formData = {'productId': productId, 'quantity': quantity, "userId": GetStorage().read('userId')};
    print(_formData);
    final AddToCartApiResponse addToCart = await _repository.addToCart(_formData);
    if (addToCart.result == true) {
      emit(AddToCartSuccessfully(addToCart.message ?? "Add To Cart Successfully"));
    } else {
      emit(FailedAddToCart(addToCart.message ?? "Failed Add To Cart"));
    }
  }

  Future<void> addOrderProduct({required String productId, required String orderId}) async {
    emit(LoadingState());
    final _formData = {'orderId': orderId, 'productId': productId};
    print(_formData);
    final AddOrderProductApiResponse addProduct = await _repository.addOrderProduct(_formData);
    if (addProduct.result == true) {
      emit(AddProductSuccessfully(addProduct.message ?? "Add Product Successfully"));
    } else {
      emit(FailedAddProduct(addProduct.message ?? "Failed Add Product"));
    }
  }
}
