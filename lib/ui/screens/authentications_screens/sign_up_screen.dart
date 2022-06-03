import 'package:aag_e_order_app/bloC/auth_cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:aag_e_order_app/ui/screens/authentications_screens/components/authentication_text_field.dart';
import 'package:aag_e_order_app/ui/screens/authentications_screens/login_screen.dart';
import 'package:aag_e_order_app/ui_components/app_button.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();
  bool value = false;

  Future<void> _onSignUpButtonPressed(BuildContext context) async {
    if (_nameTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Name");
    } else if (_emailTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Email");
    } else if (_passwordTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Password");
    } else if (_phoneTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Phone No");
    } else if (_addressTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Address");
    } else {
      context.read<SignupCubit>().signUp(
          userName: _nameTextController.text,
          password: _passwordTextController.text,
          email: _emailTextController.text,
          phoneNo: _phoneTextController.text,
          address: _addressTextController.text,
          value: value);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailed) {
            showSnackBar(context, state.message);
          }
          if (state is SignUpSuccessful) {
            showSnackBar(context, state.message, type: SnackBarType.success);
            Nav.pop(context);
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.lightGrey,
                body: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/background.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        // top: size.height * 0.15,
                        child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.13,
                        ),
                        const Center(
                          child: Text(
                            "AAG E ORDER",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.09,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text("You are about to create AagEOrder account,\n Please fill required fields"),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: AuthenticationTextField(
                            controller: _nameTextController,
                            backGroundColor: AppColors.halfWhite,
                            hintText: "Name",
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: AuthenticationTextField(
                            controller: _emailTextController,
                            backGroundColor: AppColors.halfWhite,
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress,
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
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: AuthenticationTextField(
                            controller: _phoneTextController,
                            backGroundColor: AppColors.halfWhite,
                            hintText: "Phone",
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: AuthenticationTextField(
                            controller: _addressTextController,
                            backGroundColor: AppColors.halfWhite,
                            hintText: "Address",
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text("Login as Zonal Manager"),
                          value: value,
                          onChanged: (newValue) {
                            setState(() {
                              value = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
                        ),
                        AppButton(
                          color: AppColors.dullWhite,
                          textColor: AppColors.green,
                          text: "CREATE ACCOUNT",
                          onPressed: () {
                            print(value);
                            _onSignUpButtonPressed(context);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const Center(
                          child: Text("Already have an account?"),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Center(
                          child: InkWell(
                              onTap: () {
                                Nav.push(context, const LoginScreen());
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: AppColors.green),
                              )),
                        ),
                      ],
                    ))
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
