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

import '../../../models/api_responses/all_product_api_response.dart';
import 'components/products_list_view.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen(this.id, {Key? key}) : super(key: key);

  final String id;

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  AllProductApiResponse? product;
  TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    context.read<AllProductCubit>().allProduct(id: widget.id.toString());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllProductCubit, AllProductState>(
      listener: (context, state) {
        if (state is FailedToFetchData) {
          showSnackBar(context, state.message);
        }
        if (state is AllProductsFetchedSuccessfully) {
          product = state.client;
        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.green,
                title: const Text(
                  "Products Screen",
                  style: TextStyle(color: AppColors.offWhite),
                ),
              ),
              body: (product != null)?ProductsListView(
                product!,
              ):const SizedBox(),
            ),
          ),
        );
      },
    );
  }

}
