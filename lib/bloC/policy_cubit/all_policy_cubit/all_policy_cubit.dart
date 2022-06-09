import 'package:aag_e_order_app/models/api_responses/all_policy_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_policy_state.dart';

class AllPolicyCubit extends Cubit<AllPolicyState> {
  AllPolicyCubit() : super(AllPolicyInitial());

  final Repository _repository = Repository();

  Future allPolicy({required String customerAccount}) async {
    emit(LoadingState());
    var _formData = {" CustAccount":customerAccount, "WinUser": "punjab\\dax", "WinPassword": "dax1"};
    print(_formData);
    final AllPolicyApiResponse apiResponse = await _repository.allPolicy(_formData);
    if (apiResponse.result == true) {
      emit(AllPolicyFetchedSuccessfully(apiResponse));
    } else {
      emit(FailedToFetchData("Add Client Failed"));
    }
  }
}
