import 'package:aag_e_order_app/models/api_responses/dashboard_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/get_user_api_response.dart';
import 'package:aag_e_order_app/models/model/user.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  final Repository _repository = Repository();

  Future userData() async {
    var _formData;
    if (GetStorage().read('role') == "TM") {
      _formData = {"id": GetStorage().read('userId'), "role": "TM"};
      print(" ZmID $_formData");
    }
    if (GetStorage().read('role') == "ZA") {
      _formData = {"id": GetStorage().read('userId'), "role": "ZA"};
      print(" ZmID $_formData");
    }
    if (GetStorage().read('role') == "ZM") {
      _formData = {"id": GetStorage().read('userId'), "role": "ZM"};
      print(" UserID $_formData");
    }
    final GetUserApiResponse apiResponse = await _repository.getUser(_formData);
    if (apiResponse.result == true) {
      emit(UserFetchedSuccessfully(apiResponse.data!));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "User Get Failed"));
    }
  }

  Future dashboardData() async {
    emit(LoadingState());
    var _formData;
    if (GetStorage().read('role') == "TM") {
      _formData = {
        "userId": GetStorage().read('userId'),
      };
      print(" ZmID $_formData");
    } else {
      _formData = {
        "zmId": GetStorage().read('userId'),
      };
      print(" UserID $_formData");
    }
    final DashboardApiResponse apiResponse = await _repository.dashboardData(_formData);
    if (apiResponse.result == true) {
      emit(DashboardGetSuccessfully(apiResponse.data!));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Dashboard Data Failed"));
    }
  }
}
