import 'package:aag_e_order_app/models/api_responses/add_category_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryInitial());

  final Repository _repository = Repository();

  Future addCategory({
    required String productCategory,
    required String categoryCode,
  }) async {
    emit(LoadingState());
    final data = {
      "productCategory": productCategory,
      "categoryCode": categoryCode,
      "reportSortingOrder": 1,
    };
    print(data);
    final AddCategoryApiResponse apiResponse = await _repository.addCategoryRequest(data);
    if (apiResponse.result == true) {
      emit(AddCategorySuccessfully(apiResponse.message ?? "Add Client Successfully"));
    } else {
      emit(FailedToAddClient(apiResponse.message ?? "Add Client Failed"));
    }
  }
}
