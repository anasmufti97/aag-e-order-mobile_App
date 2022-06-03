import 'dart:convert';
import 'dart:ui';

import 'package:aag_e_order_app/bloC/dashboard_cubit/dashboard_cubit.dart';
import 'package:aag_e_order_app/models/api_responses/dashboard_api_response.dart';
import 'package:aag_e_order_app/ui/screens/dashboard_screen/side_menu.dart';
import 'package:aag_e_order_app/ui/screens/home_screen/client_screens/client_screen.dart';
import 'package:aag_e_order_app/ui/screens/home_screen/delivered_order_screen/delivered_order_screen.dart';
import 'package:aag_e_order_app/ui/screens/home_screen/pending_order_screen/pending_order_screen.dart';
import 'package:aag_e_order_app/ui/screens/home_screen/rejected_order_screen/rejected_order_screen.dart';
import 'package:aag_e_order_app/ui/screens/home_screen/send_back_to_order_screen/send_back_to_order_screen.dart';
import 'package:aag_e_order_app/ui_components/loading_screen_animation.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_views/active_masters_view.dart';
import 'home_views/outstanding_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DashboardData dashboardData = DashboardData();
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh(BuildContext context) async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      context.read<DashboardCubit>().dashboardData();
    });
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    // await
  }

  @override
  void initState() {
    context.read<DashboardCubit>().dashboardData();
    super.initState();
    getApiResponse();
  }

    Future getApiResponse() async{
    final Dio dio = Dio();
    final Response response = await dio.post(
      "http://202.141.242.82/CustomerWebServices/api/values/UserAuthentication",
      data: {
        "userName":"ali",
        "password":"12345678",
        "WinUser":"punjab\\dax",
        "WinPassword":"dax1"
      },
    );
    print(response.data);
    print(response.data);
}


  @override
  Widget build(BuildContext context) {
    getApiResponse();
    Size size = MediaQuery.of(context).size;
    String token = GetStorage().read('token');
    print("User ID => $token");
    print("User ID => ${GetStorage().read('userId')}");
    print("User Role => ${GetStorage().read('role')}");
    print("User Role => ${GetStorage().read('zmId')}");
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        if (state is FailedToFetchData) {
          showSnackBar(context, state.message);
        }
        if (state is DashboardGetSuccessfully) {
          dashboardData = state.dashboardData;
        }
      },
      builder: (context, state) {
        getApiResponse();
        return LoadingScreenAnimation(
          isLoading: state is LoadingState,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.green,
                // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
                title: const Text(
                  "Ali Akbar Group",
                  style: TextStyle(color: AppColors.offWhite),
                ),
              ),
              drawer: SizedBox(
                width: size.width * 0.6,
                child: const Drawer(
                  child: SideMenu(),
                ),
              ),
              body: (state is LoadingState)
                  ? const SizedBox()
                  : SmartRefresher(
                      controller: _refreshController,
                      onRefresh: () => _onRefresh(context),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Material(
                              elevation: 3,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Nav.push(context, const ClientScreen());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      color: AppColors.darkBlue,
                                      height: size.height * 0.1,
                                      width: size.width * 0.25,
                                      child: const Center(child: Text("New\nOrder")),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Nav.push(context, const SendBackToOrderScreen());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      color: AppColors.darkYellow,
                                      height: size.height * 0.1,
                                      width: size.width * 0.25,
                                      child: Center(
                                          child: Text(
                                        "Recalled\n${dashboardData.sendBackTostatus?.count ?? 0}",
                                        textAlign: TextAlign.center,
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Nav.push(context, const DeliveredOrderScreen());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      color: AppColors.darkBlue,
                                      height: size.height * 0.1,
                                      width: size.width * 0.25,
                                      child: Center(
                                          child: Text(
                                        "Delivered\n${dashboardData.deliveredstatus?.count ?? 0}",
                                        textAlign: TextAlign.center,
                                      )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Nav.push(context, const RejectedOrderScreen());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      color: AppColors.pink,
                                      height: size.height * 0.1,
                                      width: size.width * 0.25,
                                      child: Center(
                                          child: Text(
                                        "Rejected\n${dashboardData.cancelledstatus?.count ?? 0}",
                                        textAlign: TextAlign.center,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Nav.push(context, const PendingOrderScreen());
                                        },
                                        child: Container(
                                            width: size.width * 0.6,
                                            height: size.height * 0.05,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.grey.shade700,
                                                      width: 0.5,
                                                    ),
                                                    right: BorderSide(
                                                      color: Colors.grey.shade700,
                                                      width: 1,
                                                    ))),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: SvgPicture.asset(
                                                        "assets/icons/ticket_icon.svg",
                                                        height: size.height * 0.03,
                                                        color: AppColors.green,
                                                      ),
                                                    ),
                                                    const Text("Pending    "),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                                                  child: Text("${dashboardData.pendingstatus?.count ?? 0}"),
                                                ),
                                              ],
                                            )),
                                      ),
                                      Container(
                                        width: size.width * 0.6,
                                        height: size.height * 0.05,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                  color: Colors.grey.shade700,
                                                  width: 0.5,
                                                ),
                                                right: BorderSide(
                                                  color: Colors.grey.shade700,
                                                  width: 1,
                                                ))),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                    "assets/icons/alert.svg",
                                                    height: size.height * 0.03,
                                                    color: AppColors.red,
                                                  ),
                                                ),
                                                const Text("Delivered    "),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 30.0, right: 30),
                                              child: Text("${dashboardData.deliveredstatus?.count ?? 0}"),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            const OutStandingView(),
                            ActiveMastersView(dashboardData),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
