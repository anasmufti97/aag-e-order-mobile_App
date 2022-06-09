import 'package:aag_e_order_app/models/api_responses/all_client_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'all_client_state.dart';

class AllClientCubit extends Cubit<AllClientState> {
  AllClientCubit() : super(AllClientInitial());

  final Repository _repository = Repository();

  Future allClient() async {
    emit(LoadingState());
    var _formData = {"UserId":GetStorage().read('userName'), "WinUser": "punjab\\dax", "WinPassword": "dax1"};
    final AllClientApiResponse apiResponse = await _repository.allClientRequest(_formData);
    if (apiResponse.result == true) {
      emit(AllClientFetchedSuccessfully(apiResponse));
    } else {
      emit(const FailedToFetchData( "All Client Failed"));
    }
  }

  // Future searchClient({required String name}) async {
  //   emit(LoadingState());
  //   final AllClientApiResponse apiResponse = await _repository.searchClient(name);
  //   if (apiResponse.result == true) {
  //     emit(AllClientFetchedSuccessfully(apiResponse.data));
  //   } else {
  //     emit(FailedToFetchData(apiResponse.message ?? "Add Client Failed"));
  //   }
  // }
}
