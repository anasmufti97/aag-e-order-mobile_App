import 'package:aag_e_order_app/models/api_responses/client_detail_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'client_detail_state.dart';

class ClientDetailCubit extends Cubit<ClientDetailState> {
  ClientDetailCubit() : super(ClientDetailInitial());

  final Repository _repository = Repository();

  Future addClient({
    required String id,
  }) async {
    emit(LoadingState());
    // final ClientDetailApiResponse apiResponse = await _repository.clientDetailRequest(id);
    // if (apiResponse.result == true) {
    //   emit(AddClientSuccessfully(apiResponse.data!));
    // } else {
    //   emit(FailedToFetchData(apiResponse.message ?? "Add Client Failed"));
    // }
  }
}
