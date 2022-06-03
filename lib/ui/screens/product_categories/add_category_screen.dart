import 'package:aag_e_order_app/bloC/category_cubit/add_category_cubit/add_category_cubit.dart';
import 'package:aag_e_order_app/bloC/category_cubit/all_category_cubit/all_category_cubit.dart' hide LoadingState;
import 'package:aag_e_order_app/ui_components/app_button.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  var categoryNameController = TextEditingController();
  var categoryCodeController = TextEditingController();

  Future<void> _onAddCategoryButtonPressed(BuildContext context) async {
    if (categoryNameController.text.isEmpty) {
      showSnackBar(context, "Please Enter Category Name");
    }
    if (categoryCodeController.text.isEmpty) {
      showSnackBar(context, "Please Enter Category Code");
    } else {
      context.read<AddCategoryCubit>().addCategory(
            productCategory: categoryNameController.text,
            categoryCode: categoryCodeController.text,
          );
    }
  }

  onPopBack(BuildContext context) {
    context.read<AllCategoryCubit>().allCategory();
    Nav.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AddCategoryCubit(),
      child: BlocConsumer<AddCategoryCubit, AddCategoryState>(
        listener: (context, state) {
          if (state is FailedToAddClient) {
            showSnackBar(context, state.message);
          }
          if (state is AddCategorySuccessfully) {
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
                  "Add Category",
                  style: TextStyle(color: AppColors.offWhite),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: categoryNameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            labelText: 'Category Name',
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
                        controller: categoryCodeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'code',
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
                      AppButton(
                        color: AppColors.dullWhite,
                        textColor: AppColors.green,
                        text: "Add Category",
                        onPressed: () {
                          _onAddCategoryButtonPressed(context);
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
