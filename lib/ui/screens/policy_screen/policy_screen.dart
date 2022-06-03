import 'package:aag_e_order_app/bloC/category_cubit/all_category_cubit/all_category_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/ui/screens/policy_screen/cart_screen/cart_screen.dart';
import 'package:aag_e_order_app/ui/screens/product_categories/all_product_categories_list_screen.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen(this.policyName, this.clientName, this.clientAddress, {Key? key}) : super(key: key);

  final String policyName;
  final String clientName;
  final String clientAddress;

  @override
  _PolicyScreenState createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  final List<CartData>? data = [];

  @override
  void initState() {
    context.read<AllCategoryCubit>().getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AllCategoryCubit, AllCategoryState>(
      listener: (context, state) {
        if (state is GetCartItemSuccessfully) {
          data?.clear();
          data?.addAll(state.data!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: AppColors.green,
            // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
            title: Text(
              widget.policyName,
              style: const TextStyle(color: AppColors.offWhite),
            ),
            actions: [
              GetStorage().read('role') == "TM"
                  ? Stack(alignment: Alignment.center, children: [
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Nav.push(context, const CartScreen());
                        },
                      ),
                      data!.isNotEmpty
                          ? Container(
                              alignment: Alignment.topLeft,
                              width: size.width * 0.03,
                              height: size.width * 0.03,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text(
                                "${data!.length}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 5, color: Colors.white),
                              )),
                            )
                          : const SizedBox()
                    ])
                  : const SizedBox(),
            ],
          ),
          body: ListView(
            children: [
              ListView.separated(
                itemCount: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      widget.clientName,
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
                    ),
                    subtitle: Text(widget.clientAddress),
                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Divider(
                thickness: 1,
                color: AppColors.lightGrey,
              ),
              InkWell(
                  onTap: () {
                    Nav.push(context, const AllCategoriesListScreen());
                  },
                  child: SvgPicture.asset(
                    "assets/icons/add_product.svg",
                    height: size.height * 0.06,
                    color: AppColors.green,
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Center(
                  child: Text(
                "Add Product",
                style: TextStyle(fontSize: 16, color: AppColors.green),
              )),
              const Divider(
                thickness: 1,
                color: AppColors.lightGrey,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        );
      },
    );
  }
}
