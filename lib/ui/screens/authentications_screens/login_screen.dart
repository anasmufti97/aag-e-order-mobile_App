import 'package:aag_e_order_app/bloC/auth_cubit/sign_in_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/sign_in_api_response.dart';
import 'package:aag_e_order_app/models/model/user.dart';
import 'package:aag_e_order_app/ui/screens/authentications_screens/components/authentication_text_field.dart';
import 'package:aag_e_order_app/ui/screens/authentications_screens/sign_up_screen.dart';
import 'package:aag_e_order_app/ui/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:aag_e_order_app/ui/screens/order_screen/order_screen.dart';
import 'package:aag_e_order_app/ui_components/app_button.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  Future<void> _onSignInButtonPressed(BuildContext context) async {
    if (_emailTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Email");
    }
    if (_passwordTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Password");
    } else {
      context.read<SignInCubit>().signInWithEmail(password: _passwordTextController.text, email: _emailTextController.text);
    }
  }

  SignInApiResponse? signInApiResponse;

  storeToken(String token) {
    GetStorage().write('token', token);
  }

  storeUserId(String userId) {
    GetStorage().write('userId', userId);
  }

  storeZmId(String zmId) {
    GetStorage().write('zmId', zmId);
  }

  storeUserRole(String userId) {
    GetStorage().write('role', userId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFailed) {
            showSnackBar(context, state.message);
          }
          if (state is SignInSuccessful) {
            showSnackBar(context, "Sign in Successfully", type: SnackBarType.success);
            signInApiResponse = state.user!;
          }
        },
        builder: (context, state) {
          // if (signInApiResponse.token != null) {
          //   storeToken(user.token!);
          //   storeUserId(user.id!.toString());
          //   if (user.role == "TM" || user.role == "ZM" || user.role == "ZA") {
          //     storeUserRole(user.role!);
          //   }
          //   if (user.role == "ZA") {
          //     storeZmId(user.zmId.toString());
          //   }
          //   if (user.role == "ZM" || user.role == "ZA") {
          //     Future.delayed(Duration.zero, () async {
          //       Nav.pushAndRemoveAllRoute(context, const OrderScreen());
          //     });
          //   } else {
          //     Future.delayed(Duration.zero, () async {
          //       Nav.pushAndRemoveAllRoute(context, const BottomNavigationBarScreen());
          //     });
          //   }
          // }
          // print(user.id);
          // print(user.role);
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: Scaffold(
              backgroundColor: AppColors.lightGreenShadow,
              body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.offWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: AuthenticationTextField(
                        controller: _emailTextController,
                        backGroundColor: AppColors.halfWhite,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: AuthenticationTextField(
                        controller: _passwordTextController,
                        backGroundColor: AppColors.halfWhite,
                        hintText: "Password",
                        isPassword: true,
                        autofillHints: const [AutofillHints.password],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    AppButton(
                      color: AppColors.dullWhite,
                      textColor: AppColors.green,
                      text: "Login",
                      onPressed: () {
                        _onSignInButtonPressed(context);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Nav.push(context, const SignUpScreen());
                            },
                            child: const Center(
                                child: Text(
                              "Register",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                            )),
                          ),
                          const Center(
                              child: Text(
                            "Forget Password?",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
