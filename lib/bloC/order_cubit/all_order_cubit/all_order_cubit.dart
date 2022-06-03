import 'package:aag_e_order_app/models/api_responses/all_order_list_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'all_order_state.dart';

class AllOrderCubit extends Cubit<AllOrderState> {
  AllOrderCubit() : super(AllOrderInitial());

  final Repository _repository = Repository();

  Future allOrder() async {
    emit(LoadingState());
    var _formData;
    if (GetStorage().read('role') == "ZM") {
      _formData = {
        "zmId": GetStorage().read('userId'),
      };
      print(" ZmID $_formData");
    }
    if (GetStorage().read('role') == "ZA") {
      _formData = {
        "zmId": GetStorage().read('zmId'),
      };
      print(" ZmID $_formData");
    }
    if (GetStorage().read('role') == "TM") {
      _formData = {
        "userId": GetStorage().read('userId'),
      };
      print(" ZmID $_formData");
    }
    print(_formData);
    final AllOrderListApiResponse apiResponse = await _repository.allOrder(_formData);
    if (apiResponse.result == true) {
      emit(AllOrderFetchedSuccessfully(apiResponse.data));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Get Order Failed Failed"));
    }
  }

  Future searchOrder({required String status}) async {
    emit(LoadingState());
    var _formData;
    if (GetStorage().read('role') == "TM") {
      _formData = {
        "userId": GetStorage().read('userId'),
        "order_status": status,
      };
      print(" ZmID $_formData");
    }
    if (GetStorage().read('role') == "ZM") {
      _formData = {
        "zmId": GetStorage().read('userId'),
        "order_status": status,
      };
      print(" UserID $_formData");
    }
    if (GetStorage().read('role') == "ZA") {
      _formData = {
        "zmId": GetStorage().read('zmId'),
        "order_status": status,
      };
      print(" UserID $_formData");
    }
    final AllOrderListApiResponse apiResponse = await _repository.searchOrder(_formData);
    if (apiResponse.result == true) {
      emit(AllOrderFetchedSuccessfully(apiResponse.data));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Get Order Failed Failed"));
    }
  }

  Future searchTM({required String name}) async {
    emit(LoadingState());
    var _formData;
    if (GetStorage().read('role') == "ZM") {
      _formData = {
        "zmId": GetStorage().read('userId'),
        "name": name,
      };
      print(" ZmID $_formData");
    }
    if (GetStorage().read('role') == "ZA") {
      _formData = {
        "zmId": GetStorage().read('zmId'),
        "name": name,
      };
      print(" ZmID $_formData");
    }
    final AllOrderListApiResponse apiResponse = await _repository.searchOrder(_formData);
    if (apiResponse.result == true) {
      emit(AllOrderFetchedSuccessfully(apiResponse.data));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Get Order Failed Failed"));
    }
  }
}
