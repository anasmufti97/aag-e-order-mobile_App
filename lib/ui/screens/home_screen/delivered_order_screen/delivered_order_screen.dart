import 'package:aag_e_order_app/bloC/order_cubit/all_order_cubit/all_order_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/all_order_list_api_response.dart';
import 'package:aag_e_order_app/ui/screens/order_screen/order_detail_screen/order_detail_screen.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class DeliveredOrderScreen extends StatefulWidget {
  const DeliveredOrderScreen({Key? key}) : super(key: key);

  @override
  _DeliveredOrderScreenState createState() => _DeliveredOrderScreenState();
}

class _DeliveredOrderScreenState extends State<DeliveredOrderScreen> {
  List<OrderData> orderData = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllOrderCubit()..allOrder(),
      child: BlocConsumer<AllOrderCubit, AllOrderState>(
        listener: (context, state) {
          if (state is FailedToFetchData) {
            showSnackBar(context, state.message);
          }
          if (state is AllOrderFetchedSuccessfully) {
            orderData.addAll(state.order!);
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: SafeArea(
                child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.green,
                // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
                title: const Text(
                  "Orders",
                  style: TextStyle(color: AppColors.offWhite),
                ),
              ),
              body: ListView.builder(
                itemBuilder: (context, index) {
                  if (orderData[index].status == "delivered") {
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
                                Text("${orderData[index].updatedAt}".substring(0, 10)),
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
                  } else {
                    return Container();
                  }
                },
                itemCount: orderData.length,
              ),
            )),
          );
        },
      ),
    );
  }
}
