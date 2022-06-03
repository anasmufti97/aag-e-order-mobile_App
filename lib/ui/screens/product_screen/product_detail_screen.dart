import 'dart:async';

import 'package:aag_e_order_app/bloC/order_cubit/order_detail_cubit/order_detail_cubit.dart' hide LoadingState, FailedToFetchData;
import 'package:aag_e_order_app/bloC/product_cubit/all_product_cubit/all_product_cubit.dart' hide LoadingState, FailedToFetchData;
import 'package:aag_e_order_app/bloC/product_cubit/product_detail_cubit/product_detail_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/product_detail_api_response.dart';
import 'package:aag_e_order_app/ui_components/app_button.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(this.id, {Key? key, this.orderId}) : super(key: key);

  final int id;
  final int? orderId;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  TextEditingController quantityController = TextEditingController();
  int? price;
  int? nt = 0;

  Product _product = Product();

  backToProductScreen(BuildContext context) {
    context.read<AllProductCubit>().getCartItems();
    Nav.pop(context);
  }

  Future<void> _onAddToCartButtonPressed(BuildContext context) async {
    if (quantityController.text.isEmpty) {
      showSnackBar(context, "Please Enter Quantity");
    } else {
      context.read<ProductDetailCubit>().addToCart(quantity: quantityController.text, productId: widget.id.toString()).then((value) {
        showSnackBar(context, "Add Product Successfully", type: SnackBarType.success);
        quantityController.clear();
        backToProductScreen(context);
      });
    }
  }

  Future<void> _onAddProductButtonPressed(BuildContext context) async {
    context.read<ProductDetailCubit>().addOrderProduct(orderId: widget.orderId.toString(), productId: widget.id.toString());
  }

  backToOrderDetailScreen(BuildContext context) {
    context.read<OrderDetailCubit>().orderData(id: widget.orderId.toString());
    Nav.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProductDetailCubit()..productDetail(id: widget.id.toString()),
      child: BlocConsumer<ProductDetailCubit, ProductDetailState>(
        listener: (context, state) {
          if (state is FailedToFetchData) {
            showSnackBar(context, state.message);
          }
          if (state is ProductDetailFetchedSuccessfully) {
            _product = state.product;
            price = _product.price ?? 0;
          }
          if (state is AddToCartSuccessfully) {}
          if (state is AddProductSuccessfully) {
            showSnackBar(context, state.message, type: SnackBarType.success);
            backToOrderDetailScreen(context);
          }
        },
        builder: (context, state) {
          void _calculation() {
            if (quantityController.text.isEmpty) {
              setState(() {
                nt = 0;
              });
            } else {
              setState(
                () {
                  nt = int.parse(quantityController.text) * price!;
                },
              );
            }
          }

          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.green,
                // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
                title: Text(
                  _product.productGenericName ?? '',
                  style: const TextStyle(color: AppColors.offWhite),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      color: Colors.white,
                      height: size.height * 0.3,
                      width: size.width * 0.95,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          _product.image ?? 'https://gateway.ipfs.io/ipfs/QmbA5sPYKq78MgixK3vp1pYveFAytwPtfBwi4CkWfUGeC6',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _product.productGenericName ?? '',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              _product.category?.productCategory ?? '',
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //   "\$ ${_product.price}",
                                //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                // ),
                                const SizedBox(),
                                widget.orderId == null
                                    ? Column(
                                        children: [
                                          Container(
                                            height: size.height * 0.05,
                                            width: size.width * 0.2,
                                            color: AppColors.dullWhite,
                                            child: TextField(
                                              onChanged: (value) {
                                                _calculation();
                                              },
                                              onSubmitted: (value) {
                                                _calculation();
                                              },
                                              textAlign: TextAlign.center,
                                              textAlignVertical: TextAlignVertical.center,
                                              controller: quantityController,
                                              keyboardType: TextInputType.number,
                                              decoration: const InputDecoration(
                                                hintText: "QTY",
                                              ),
                                              style: const TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          // Text(
                                          //   "$nt",
                                          //   style: const TextStyle(
                                          //     fontSize: 16,
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            const Text(
                              "About",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              _product.descriptions ?? '',
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            widget.orderId == null
                                ? AppButton(
                                    color: AppColors.green,
                                    textColor: AppColors.dullWhite,
                                    text: "Add To Cart ",
                                    onPressed: () {
                                      _onAddToCartButtonPressed(context);
                                    },
                                  )
                                : AppButton(
                                    color: AppColors.green,
                                    textColor: AppColors.dullWhite,
                                    text: "Add Product ",
                                    onPressed: () {
                                      _onAddProductButtonPressed(context);
                                    },
                                  ),
                          ],
                        ),
                      ),
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
