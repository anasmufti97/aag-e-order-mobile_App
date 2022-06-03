import 'package:aag_e_order_app/bloC/order_cubit/all_order_cubit/all_order_cubit.dart' hide LoadingState, FailedToFetchData;
import 'package:aag_e_order_app/bloC/order_cubit/order_detail_cubit/order_detail_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/order_detail_api_response.dart';
import 'package:aag_e_order_app/ui/screens/product_categories/all_product_categories_list_screen.dart';
import 'package:aag_e_order_app/ui_components/app_button.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderUpdateScreen extends StatefulWidget {
  const OrderUpdateScreen(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  _OrderUpdateScreenState createState() => _OrderUpdateScreenState();
}

class _OrderUpdateScreenState extends State<OrderUpdateScreen> {
  OrderData orderData = OrderData();
  int? totalPrice;
  String? _dropDownValue;
  List<TextEditingController> _controller = [];
  final TextEditingController qtyTextEditingController = TextEditingController();
  int sum = 0;
  List val = [];

  Future<void> _orderChangeButtonPressed(BuildContext context, String status) async {
    if (_dropDownValue!.isEmpty) {
      showSnackBar(context, "Please Select Status");
    } else {
      context.read<OrderDetailCubit>().orderStatusChange(
            id: widget.id.toString(),
            status: status,
          );
    }
  }

  Future<void> _onDeleteButtonPressed(BuildContext context, int productId) async {
    context
        .read<OrderDetailCubit>()
        .deleteOrderProduct(orderId: widget.id, productId: productId)
        .then((value) => {context.read<OrderDetailCubit>().orderData(id: widget.id.toString())});
  }

  backToProductScreen(BuildContext context) {
    context.read<AllOrderCubit>().allOrder();
    Nav.pop(context);
  }

  @override
  void initState() {
    context.read<OrderDetailCubit>().orderData(id: widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<OrderDetailCubit, OrderDetailState>(
      listener: (context, state) {
        if (state is FailedToFetchData) {
          showSnackBar(context, state.message);
        }
        if (state is DeleteOrderProductSuccessfully) {}
        if (state is OrderDataFetchedSuccessfully) {
          orderData = state.orderData;
          totalPrice = state.totalPrice;
          _controller = [
            for (int i = 0; i < orderData.products!.length; i++) TextEditingController(text: orderData.products![i].orderDetail?.quantity.toString())
          ];

          val.clear();
          for (int i = 0; i < (orderData.products?.length ?? 0); i++) {
            val.add(int.parse(_controller[i].text));
          }

          sum = val.reduce((value, element) => value + element);
        }
        if (state is OrderStatusChangeSuccessfully) {
          showSnackBar(context, "Order Update Successfully", type: SnackBarType.success);
          backToProductScreen(context);
        }
      },
      builder: (context, state) {
        void _calculation() {
          val.clear();
          for (int i = 0; i < (orderData.products?.length ?? 0); i++) {
            val.add(int.parse(_controller[i].text));
          }
          setState(() {
            sum = val.reduce((value, element) => value + element);
          });
        }

        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: WillPopScope(
            onWillPop: () => backToProductScreen(context),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.green,
                title: const Text(
                  "Orders Detail",
                  style: TextStyle(color: AppColors.offWhite),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Nav.push(
                            context,
                            AllCategoriesListScreen(
                              id: orderData.id,
                            ));
                      },
                      icon: const Icon(
                        Icons.add,
                      ))
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Order",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text("#000${orderData.id}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Status",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${orderData.status}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Quantity",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$sum',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Product",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "${orderData.products![index].image}",
                                    width: 100,
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
                                            "${orderData.products![index].productGenericName}",
                                            maxLines: 1,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                                          ),
                                        ),
                                        // Text(
                                        //   "\$${orderData.products![index].price}",
                                        //   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
                                        // ),
                                      ],
                                    ),
                                    LimitedBox(
                                      maxHeight: 50,
                                      child: Text(
                                        orderData.products![index].descriptions ?? '',
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
                                        IconButton(
                                            onPressed: () {
                                              _onDeleteButtonPressed(context, orderData.products![index].id!);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                        SizedBox(
                                          width: 30,
                                          child: TextField(
                                            controller: _controller[index],
                                            onSubmitted: (value) {
                                              _calculation();
                                            },
                                            onChanged: (value) {
                                              _calculation();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60.0),
                            child: Divider(
                              thickness: 2,
                            ),
                          );
                        },
                        itemCount: orderData.products?.length ?? 0),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    AppButton(
                      text: "Submit",
                      onPressed: () {
                        List dem = [];
                        print(qtyTextEditingController);
                        for (int i = 0; i < orderData.products!.length; i++) {
                          var val = {"productId": orderData.products![i].id, "quantity": _controller[i].text};
                          dem.add(val);
                        }
                        context.read<OrderDetailCubit>().updateOrder(id: widget.id.toString(), productList: dem);
                      },
                    ),
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
