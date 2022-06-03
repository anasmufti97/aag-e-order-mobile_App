import 'package:aag_e_order_app/bloC/client/add_client_cubit/add_client_cubit.dart';
import 'package:aag_e_order_app/bloC/client/all_client_cubit/all_client_cubit.dart' hide LoadingState;
import 'package:aag_e_order_app/ui_components/app_button.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  _AddClientScreenState createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  var addressController = TextEditingController();
  var locationController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var contactPersonController = TextEditingController();
  var regionController = TextEditingController();
  var shopChainController = TextEditingController();
  var clientNameController = TextEditingController();

  Future<void> _onAddClientButtonPressed(BuildContext context) async {
    if (clientNameController.text.isEmpty) {
      showSnackBar(context, "Please Enter Name");
    }
    if (emailController.text.isEmpty) {
      showSnackBar(context, "Please Enter Email");
    }
    if (addressController.text.isEmpty) {
      showSnackBar(context, "Please Enter Address");
    }
    if (phoneController.text.isEmpty) {
      showSnackBar(context, "Please Enter Phone No");
    }
    if (shopChainController.text.isEmpty) {
      showSnackBar(context, "Please Enter Shop Chain");
    }
    if (regionController.text.isEmpty) {
      showSnackBar(context, "Please Enter Region");
    } else {
      context.read<AddClientCubit>().addClient(
          userName: clientNameController.text,
          region: regionController.text,
          email: emailController.text,
          phoneNo: phoneController.text,
          address: addressController.text,
          chain: shopChainController.text);
    }
  }

  onPopBack(BuildContext context) {
    context.read<AllClientCubit>().allClient();
    Nav.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AddClientCubit(),
      child: BlocConsumer<AddClientCubit, AddClientState>(
        listener: (context, state) {
          if (state is FailedToAddClient) {
            showSnackBar(context, state.message);
          }
          if (state is AddClientSuccessfully) {
            showSnackBar(context, state.message, type: SnackBarType.success);
            onPopBack(context);
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.green,
                // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
                title: const Text(
                  "Clients",
                  style: TextStyle(color: AppColors.offWhite),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          Nav.pop(context);
                        },
                        child: const Icon(
                          Icons.check,
                        )),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: clientNameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: 'Client Name',
                            labelStyle: TextStyle(fontSize: 16),
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.green,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                        controller: addressController,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                            labelText: 'Address',
                            labelStyle: TextStyle(fontSize: 16),
                            suffixIcon: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.green,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 22.0),
                      //   child: TextField(
                      //     controller: locationController,
                      //     keyboardType: TextInputType.streetAddress,
                      //     decoration: const InputDecoration(
                      //         labelText: 'Location Cordinates',
                      //         labelStyle: TextStyle(fontSize: 16),
                      //         suffixIcon: Icon(
                      //           Icons.location_on_rounded,
                      //           size: 30,
                      //           color: AppColors.green,
                      //         ),
                      //         hintStyle:
                      //             TextStyle(color: Colors.grey, fontSize: 10)),
                      //     style: const TextStyle(fontSize: 14),
                      //   ),
                      // ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: 'Email', labelStyle: TextStyle(fontSize: 16), hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            labelText: 'Phone', labelStyle: TextStyle(fontSize: 16), hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // TextField(
                      //   controller: contactPersonController,
                      //   keyboardType: TextInputType.name,
                      //   decoration: const InputDecoration(
                      //       labelText: 'Contact person',
                      //       labelStyle: TextStyle(fontSize: 16),
                      //       hintStyle:
                      //           TextStyle(color: Colors.grey, fontSize: 10)),
                      //   style: const TextStyle(fontSize: 14),
                      // ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                        controller: regionController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: 'Region', labelStyle: TextStyle(fontSize: 16), hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                        controller: shopChainController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: 'Shop chain', labelStyle: TextStyle(fontSize: 16), hintStyle: TextStyle(color: Colors.grey, fontSize: 10)),
                        style: const TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      AppButton(
                        color: AppColors.dullWhite,
                        textColor: AppColors.green,
                        text: "Add Client",
                        onPressed: () {
                          _onAddClientButtonPressed(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
