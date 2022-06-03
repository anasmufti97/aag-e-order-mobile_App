import 'dart:async';

import 'package:aag_e_order_app/bloC/cart_cubit/cart_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/ui/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:aag_e_order_app/ui_components/app_button.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import 'item_quantity.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartData> cartItems = [];

  Future<void> _onDeleteButtonPressed(BuildContext context, id) async {
    context.read<CartCubit>().deleteCartItem(itemId: id.toString());
  }

  @override
  void initState() {
    context.read<CartCubit>().getCartItems();
    super.initState();
  }

  Future<void> _orderCreateButtonPressed(BuildContext context, var itemId) async {
    context.read<CartCubit>().orderPlace(productsId: itemId.toString());
  }

  int price = 0;

  void _displayErrorMotionToast(BuildContext context, String message) {
    MotionToast.success(
      title: 'Congratulations',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      description: message,
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.center,
      width: 300,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is FailedToFetchedProduct) {
          showSnackBar(context, state.message);
        }
        if (state is FetchedAllProducts) {
          cartItems.clear();
          cartItems.addAll(state.data!);
          price = state.totalPrice!;
        }
        if (state is DeleteProductSuccessfully) {
          showSnackBar(context, state.message, type: SnackBarType.success);
          context.read<CartCubit>().getCartItems();
        }
        if (state is UpdateProductQuantity) {
          showSnackBar(context, state.message, type: SnackBarType.success);
        }
        if (state is OrderCreateSuccessfully) {

          _displayErrorMotionToast(context,state.message);

          Timer(const Duration(seconds: 3), () => {Nav.pushAndRemoveAllRoute(context, const BottomNavigationBarScreen())});
        }
        if(state is CreateOrderFailed){
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text("Cart"),
              ),
              body: (state is FetchedAllProducts && cartItems.isEmpty)
                  ? Center(child: Lottie.asset('assets/lotties/no_data.json'))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: size.height * 0.7,
                            child: ListView.separated(
                              itemCount: cartItems.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      height: 120,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          cartItems[index].product?.image ?? '',
                                          width: 140,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.57,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  cartItems[index].product?.productGenericName ?? '',
                                                  maxLines: 1,
                                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                                                ),
                                              ),
                                              // Text(
                                              //   "\$${cartItems[index].product?.price}",
                                              //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                                              // ),
                                            ],
                                          ),
                                          LimitedBox(
                                            maxHeight: 50,
                                            child: Text(
                                              cartItems[index].product?.descriptions ?? '',
                                              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey),
                                              maxLines: 3,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ItemQuantity(int.parse(cartItems[index].quantity!), cartItems[index].id!),
                                              IconButton(
                                                  alignment: Alignment.center,
                                                  onPressed: () {
                                                    _onDeleteButtonPressed(context, cartItems[index].id!);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return const Divider();
                              },
                            ),
                          ),
                          (cartItems.isNotEmpty)
                              ? Container(
                                  height: 120,
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                                    child: Column(
                                      children: [
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        //     const Text(
                                        //       'Total Price ',
                                        //       style: TextStyle(
                                        //         color: Colors.black,
                                        //         fontSize: 18,
                                        //       ),
                                        //     ),
                                        //     const SizedBox(
                                        //       width: 10,
                                        //     ),
                                        //     Text(
                                        //       '\$$price',
                                        //       style: const TextStyle(color: Colors.black, fontSize: 18),
                                        //     ),
                                        //   ],
                                        // ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        AppButton(
                                          color: AppColors.dullWhite,
                                          textColor: AppColors.green,
                                          text: "Create Order",
                                          onPressed: () {
                                            // _displayErrorMotionToast();

                                            List<dynamic> items = [];
                                            for (int i = 0; i < cartItems.length; i++) {
                                              print(cartItems[i].product?.id);
                                              items.add(cartItems[i].product?.id);
                                            }
                                            print(items.toString());
                                            _orderCreateButtonPressed(context, items.toString()).then((value) => {});
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
