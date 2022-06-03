import 'package:aag_e_order_app/bloC/order_cubit/all_order_cubit/all_order_cubit.dart' hide LoadingState, FailedToFetchData;
import 'package:aag_e_order_app/bloC/order_cubit/order_detail_cubit/order_detail_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/order_detail_api_response.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrderData orderData = OrderData();
  int? totalPrice;
  String? _dropDownValue;
  List<TextEditingController> _controller = [];
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
                        (GetStorage().read('role') == "ZA")
                            ? orderData.status == 'pending'
                            ? DropdownButton(
                          value: _dropDownValue,
                          // isExpanded: true,
                          hint: Text(orderData.status ?? "Select Status"),
                          iconSize: 30.0,
                          style: const TextStyle(color: Colors.black),
                          items: ['pending', 'sendBackTo', 'cancelled', 'delivered'].map(
                                (String val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              _dropDownValue = val;
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Are You Sure?",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          content: const Text("You want to Change Status?"),
                                          actions: <Widget>[
                                            MaterialButton(
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(color: Colors.blue),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            MaterialButton(
                                              child: const Text(
                                                "OK",
                                                style: TextStyle(color: Colors.red),
                                              ),
                                              onPressed: () {
                                                _orderChangeButtonPressed(context, _dropDownValue!).then((value) => {Nav.pop(context)});
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                            });
                          },
                        )
                            : Text(
                          '${orderData.status}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                            : Text(
                          '${orderData.status}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),Row(
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
                                        const Text('Quantity'),
                                        Text("${orderData.products![index].orderDetail?.quantity ?? ''}"),
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
