import 'package:aag_e_order_app/models/api_responses/sign_up_api_response.dart';
import 'package:aag_e_order_app/resources/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupCubit() : super(SignupInitial());

  final _repository = Repository();

  Future signUp({
    required String userName,
    required String email,
    required String phoneNo,
    required String password,
    required String address,
    required bool value,
  }) async {
    var data;
    emit(LoadingState());
    if (value == false) {
      data = {"fullName": userName, "email": email, "password": password.toString(), "telephones": phoneNo, "address": address, "role": "TM"};
    } else {
      data = {"fullName": userName, "email": email, "password": password.toString(), "telephones": phoneNo, "address": address, "role": "ZM"};
    }

    print(data);

    print(data);
    final SignUpApiResponse signUpModel = await _repository.signUp(data);
    if (signUpModel.result == true) {
      emit(const SignUpSuccessful("Sign Up Successfully"));
    } else {
      emit(const SignUpFailed("SignUp Failed"));
    }
  }
}
