import 'package:aag_e_order_app/bloC/order_cubit/all_order_cubit/all_order_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/all_order_list_api_response.dart';
import 'package:aag_e_order_app/ui/screens/dashboard_screen/side_menu.dart';
import 'package:aag_e_order_app/ui/screens/order_screen/order_detail_screen/order_detail_screen.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<OrderData> orderData = [];
  TextEditingController searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    context.read<AllOrderCubit>().allOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("User ID => ${GetStorage().read('userId')}");
    print("User Role => ${GetStorage().read('role')}");
    print("User Role => ${GetStorage().read('zmId')}");
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AllOrderCubit, AllOrderState>(
      listener: (context, state) {
        if (state is FailedToFetchData) {
          showSnackBar(context, state.message);
        }
        if (state is AllOrderFetchedSuccessfully) {
          orderData.clear();
          orderData.addAll(state.order!);
        }
      },
      builder: (context, state) {
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: SafeArea(
              child: Scaffold(
                  key: _scaffoldKey,
                  appBar: AppBar(
                    backgroundColor: AppColors.green,
                    title: (GetStorage().read('role') == "TM") ? const Text("All Orders") : _buildTopAppbar(context),
                    actions: [myPopMenu()],
                    leading: (GetStorage().read('role') != "TM")
                        ? Builder(
                            builder: (context) {
                              return IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: const Icon(Icons.menu_outlined));
                            },
                          )
                        : const SizedBox(),
                  ),
                  drawer: (GetStorage().read('role') != "TM")
                      ? SizedBox(
                          width: size.width * 0.6,
                          child: const Drawer(
                            child: SideMenu(),
                          ),
                        )
                      : const SizedBox(),
                  body: orderData.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  Nav.push(context, OrderDetailScreen(orderData[index].id!));
                                },
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Order"),
                                    Text("#000${orderData[index].id}"),
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Status"),
                                        Text("${orderData[index].status}"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Date"),
                                        Text("${orderData[index].createdAt}".substring(0, 10)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     const Text("Total Price"),
                                    //     Text("\$${orderData[index].totalPrice}"),
                                    //   ],
                                    // ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GetStorage().read('role') != "TM"
                                        ? Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text("TM"),
                                              Text(orderData[index].user?.fullName ?? ''),
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                                leading: SvgPicture.asset(
                                  'assets/icons/orders.svg',
                                  height: 70,
                                ),
                              ),
                            );
                          },
                          itemCount: orderData.length,
                        )
                      : const Center(child: Text('No Data Found')))),
        );
      },
    );
  }

  Row _buildTopAppbar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * .55,
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
      context.read<AllOrderCubit>().allOrder();
    } else {
      await context.read<AllOrderCubit>().searchTM(name: searchController.text);
    }
  }

  Future<void> searchResultTm(BuildContext context, String value) async {
    await context.read<AllOrderCubit>().searchOrder(status: value);
  }

  Widget myPopMenu() {
    return PopupMenuButton(
        icon: const Icon(Icons.filter_alt),
        onSelected: (String value) {
          searchResultTm(context, value);
        },
        itemBuilder: (context) => const [
              PopupMenuItem(value: "", child: Text('All')),
              PopupMenuItem(value: "pending", child: Text('Pending')),
              PopupMenuItem(value: "sendBackTo", child: Text('Send Back To')),
              PopupMenuItem(value: "cancelled", child: Text('Cancelled')),
              PopupMenuItem(value: "delivered", child: Text('Delivered')),
            ]);
  }
}
