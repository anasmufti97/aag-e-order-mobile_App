import 'package:aag_e_order_app/bloC/category_cubit/all_category_cubit/all_category_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/all_category_api_response.dart';
import 'package:aag_e_order_app/models/api_responses/cart_items_api_response.dart';
import 'package:aag_e_order_app/ui/screens/policy_screen/cart_screen/cart_screen.dart';
import 'package:aag_e_order_app/ui/screens/product_categories/add_category_screen.dart';
import 'package:aag_e_order_app/ui/screens/product_screen/products_screens.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class AllCategoriesListScreen extends StatefulWidget {
  const AllCategoriesListScreen({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  _AllCategoriesListScreenState createState() => _AllCategoriesListScreenState();
}

class _AllCategoriesListScreenState extends State<AllCategoriesListScreen> {
  final List<Category>? category = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    context.read<AllCategoryCubit>().allCategory();
    context.read<AllCategoryCubit>().getCartItems();
    super.initState();
  }

  final List<CartData>? data = [];

  backToProductCategoryScreen(BuildContext context) {
    context.read<AllCategoryCubit>().getCartItems();
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AllCategoryCubit, AllCategoryState>(
      listener: (context, state) {
        if (state is FailedToFetchData) {
          showSnackBar(context, state.message);
        }
        if (state is AllCategoryFetchedSuccessfully) {
          category?.clear();
          category?.addAll(state.category!);
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
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: AppColors.green,
                actions: [
                  _buildTopAppbar(context),
                  GetStorage().read('role') == "TM"
                      ? InkWell(
                          onTap: () {
                            Nav.push(context, const AddCategoryScreen());
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox(),
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
              body: category!.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 9.0),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: ListTile(
                                onTap: () {
                                  // if (widget.id != null) {
                                  //   Navigator.pushReplacement(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) => ProductsScreen(category![index].id!, orderId: widget.id),
                                  //       )).then((value) => setState(() {}));
                                  // } else {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //         builder: (context) => ProductsScreen(category![index].id!, orderId: widget.id),
                                  //       )).then((value) => setState(() {}));
                                  // }
                                },
                                leading: SizedBox(
                                    height: size.height * 0.04,
                                    width: size.width * 0.1,
                                    child: SvgPicture.asset(
                                      "assets/icons/folder.svg",
                                      color: AppColors.green,
                                    )),
                                title: Text(
                                  category![index].productCategory ?? '',
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: category!.length),
                    )
                  : const Center(child: Text('No Data Found')),
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
      context.read<AllCategoryCubit>().allCategory();
    } else {
      await context.read<AllCategoryCubit>().searchCategory(name: searchController.text);
    }
  }
}
