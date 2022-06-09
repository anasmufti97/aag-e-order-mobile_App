import 'package:aag_e_order_app/models/api_responses/sign_in_api_response.dart';
import 'package:aag_e_order_app/models/model/user.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_storage/get_storage.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  final repository = Repository();

  Future<void> signInWithEmail({required String userName, required String password}) async {
    emit(LoadingState());

    var _formData = {'userName': userName, 'password': password, "WinUser": "punjab\\dax", "WinPassword": "dax1"};
    final SignInApiResponse signInModel = await repository.signIn(_formData);
    if (signInModel.status == "pass") {
      signInModel.userName = userName;
      storeUserId(signInModel.userName!);
      emit(SignInSuccessful(signInModel));
    } else {
      emit(const SignInFailed("Sign In Failed"));
    }
  }
  storeUserId(String userName) {
    GetStorage().write('userName', userName);
  }
}
