import 'package:aag_e_order_app/models/api_responses/all_category_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'all_category_state.dart';

class AllCategoryCubit extends Cubit<AllCategoryState> {
  AllCategoryCubit() : super(AllCategoryInitial());

  final Repository _repository = Repository();

  Future allCategory() async {
    emit(LoadingState());
    final AllCategoryApiResponse apiResponse = await _repository.allCategory();
    if (apiResponse.result == true) {
      emit(AllCategoryFetchedSuccessfully(apiResponse.data));
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

  Future searchCategory({required String name}) async {
    emit(LoadingState());
    final AllCategoryApiResponse apiResponse = await _repository.searchCategory(name);
    if (apiResponse.result == true) {
      emit(AllCategoryFetchedSuccessfully(apiResponse.data));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Searching Failed"));
    }
  }
}
