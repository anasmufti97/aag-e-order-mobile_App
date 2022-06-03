import 'package:aag_e_order_app/bloC/dashboard_cubit/dashboard_cubit.dart';
import 'package:aag_e_order_app/models/model/user.dart';
import 'package:aag_e_order_app/ui/screens/authentications_screens/login_screen.dart';
import 'package:aag_e_order_app/ui/screens/product_categories/all_product_categories_list_screen.dart';
import 'package:aag_e_order_app/ui_components/show_snack_bar.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  User user = User();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => DashboardCubit()..userData(),
      child: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {
          if (state is FailedToFetchData) {
            showSnackBar(context, state.message);
          }
          if (state is UserFetchedSuccessfully) {
            user = state.user;
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(user.fullName ?? ''),
                    accountEmail: Text(
                      "${GetStorage().read('role') ?? "ZM"} : ${user.email ?? ''}",
                      style: const TextStyle(fontSize: 12),
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                    ),
                    currentAccountPicture: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        GetStorage().read('role') == "TM"
                            ? ListTile(
                                leading: SvgPicture.asset(
                                  "assets/icons/client.svg",
                                  color: AppColors.lightGreen,
                                  height: size.height * 0.04,
                                ),
                                title: const Text("CLIENTS"),
                                onTap: () {},
                              )
                            : const SizedBox(),
                        GetStorage().read('role') == "TM"
                            ? ListTile(
                                leading: SvgPicture.asset(
                                  "assets/icons/history.svg",
                                  color: AppColors.lightGreen,
                                  height: size.height * 0.04,
                                ),
                                title: const Text("HISTORY"),
                              )
                            : const SizedBox(),
                        GetStorage().read('role') == "TM"
                            ? ListTile(
                                leading: SvgPicture.asset(
                                  "assets/icons/ticket.svg",
                                  color: AppColors.lightGreen,
                                  height: size.height * 0.04,
                                ),
                                title: const Text("PRODUCTS"),
                                onTap: () {
                                  Nav.push(context, const AllCategoriesListScreen());
                                },
                              )
                            : const SizedBox(),
                        ListTile(
                          onTap: () {
                            GetStorage().write('userId', null);
                            GetStorage().write('role', null);
                            GetStorage().write('token', null);
                            showSnackBar(context, "Logout Successfully", type: SnackBarType.success);
                            Nav.pushAndRemoveAllRoute(context, const LoginScreen());
                          },
                          leading: SvgPicture.asset(
                            "assets/icons/settings.svg",
                            color: AppColors.lightGreen,
                            height: size.height * 0.04,
                          ),
                          title: const Text("LOGOUT"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
