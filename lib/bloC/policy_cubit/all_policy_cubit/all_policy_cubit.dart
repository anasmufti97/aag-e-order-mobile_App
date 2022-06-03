import 'package:aag_e_order_app/models/api_responses/all_policy_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_policy_state.dart';

class AllPolicyCubit extends Cubit<AllPolicyState> {
  AllPolicyCubit() : super(AllPolicyInitial());

  final Repository _repository = Repository();

  Future allPolicy() async {
    emit(LoadingState());
    final AllPolicyApiResponse apiResponse = await _repository.allPolicy();
    if (apiResponse.result == true) {
      emit(AllPolicyFetchedSuccessfully(apiResponse.data));
    } else {
      emit(FailedToFetchData(apiResponse.message ?? "Add Client Failed"));
    }
  }
}
