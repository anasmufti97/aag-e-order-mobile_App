import 'package:aag_e_order_app/bloC/category_cubit/all_category_cubit/all_category_cubit.dart'
    hide LoadingState, FailedToFetchData, GetCartItemSuccessfully;
import 'package:aag_e_order_app/bloC/product_cubit/all_product_cubit/all_product_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/models/model/product.dart';
import 'package:aag_e_order_app/ui/screens/policy_screen/cart_screen/cart_screen.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'components/products_list_view.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen(this.id, {Key? key, this.orderId}) : super(key: key);

  final int id;
  final int? orderId;

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> product = [];
  TextEditingController searchController = TextEditingController();

  final List<CartData>? data = [];

  @override
  void initState() {
    context.read<AllProductCubit>().allProduct(id: widget.id.toString());
    context.read<AllProductCubit>().getCartItems();
    super.initState();
  }

  backToProductCategoryScreen(BuildContext context) {
    context.read<AllCategoryCubit>().allCategory();
    context.read<AllCategoryCubit>().getCartItems();
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AllProductCubit, AllProductState>(
      listener: (context, state) {
        if (state is FailedToFetchData) {
          showSnackBar(context, state.message);
        }
        if (state is AllProductsFetchedSuccessfully) {
          product.clear();
          product.addAll(state.client!);
        }
        if (state is GetCartItemSuccessfully) {
          data?.clear();
          data?.addAll(state.data!);
        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: WillPopScope(
            onWillPop: () => backToProductCategoryScreen(context),
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.green,
                  leading: IconButton(
                      onPressed: () {
                        backToProductCategoryScreen(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  title: const Text(
                    "Products Screen",
                    style: TextStyle(color: AppColors.offWhite),
                  ),
                  actions: [
                    _buildTopAppbar(context),
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
                body: product.isNotEmpty || searchController.text.isNotEmpty
                    ? ProductsListView(
                        product,
                        orderId: widget.orderId,
                      )
                    : ProductsListView(
                        product,
                        orderId: widget.orderId,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  Row _buildTopAppbar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        height: 40,
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
              hintText: "Search here ?",
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        searchController.clear();
                        searchResult(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
              hintStyle: const TextStyle(fontSize: 12.0, color: AppColors.dullWhite),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
              ),
              contentPadding: const EdgeInsets.all(10.0)),
          onSubmitted: (text) {
            searchResult(context);
          },
          onChanged: (value) {
            searchResult(context);
          },
        ),
      ),
      const SizedBox(
        width: 20,
      )
    ]);
  }

  Future<void> searchResult(BuildContext context) async {
    if (searchController.text.isEmpty) {
      context.read<AllProductCubit>().allProduct(id: widget.id.toString());
    } else {
      await context.read<AllProductCubit>().searchProduct(id: widget.id.toString(), name: searchController.text);
    }
  }
}
