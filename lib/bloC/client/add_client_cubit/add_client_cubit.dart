import 'package:aag_e_order_app/models/api_responses/add_client_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_client_state.dart';

class AddClientCubit extends Cubit<AddClientState> {
  AddClientCubit() : super(AddClientInitial());

  final Repository _repository = Repository();

  Future addClient({
    required String userName,
    required String email,
    required String phoneNo,
    required String region,
    required String address,
    required String chain,
  }) async {
    emit(LoadingState());
    final data = {"name": userName, "email": email, "region": region.toString(), "phone": phoneNo, "address": address, "shopChain": chain};
    print(data);
    // final AddClientApiResponse apiResponse = await _repository.addClientRequest(data);
    // if (apiResponse.result == true) {
    //   emit(AddClientSuccessfully(apiResponse.message ?? "Add Client Successfully"));
    // } else {
    //   emit(FailedToAddClient(apiResponse.message ?? "Add Client Failed"));
    // }
  }
}
