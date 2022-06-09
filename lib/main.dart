import 'package:aag_e_order_app/bloC/cart_cubit/cart_cubit.dart';
import 'package:aag_e_order_app/bloC/category_cubit/all_category_cubit/all_category_cubit.dart';
import 'package:aag_e_order_app/bloC/client/all_client_cubit/all_client_cubit.dart';
import 'package:aag_e_order_app/bloC/dashboard_cubit/dashboard_cubit.dart';
import 'package:aag_e_order_app/bloC/order_cubit/all_order_cubit/all_order_cubit.dart';
import 'package:aag_e_order_app/ui/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:aag_e_order_app/ui/screens/order_screen/order_screen.dart';
import 'package:aag_e_order_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import 'bloC/order_cubit/order_detail_cubit/order_detail_cubit.dart';
import 'bloC/product_cubit/all_product_cubit/all_product_cubit.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllClientCubit()..allClient(),
        ),
        BlocProvider(
          create: (context) => AllCategoryCubit()
            ..allCategory()
            ..getCartItems(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..getCartItems(),
        ),
        BlocProvider(
          create: (context) => AllOrderCubit()..allOrder(),
        ),
        BlocProvider(
          create: (context) => AllProductCubit(),
        ),
        BlocProvider(
          create: (context) => DashboardCubit(),
        ),
        BlocProvider(
          create: (context) => OrderDetailCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Agg E Order',
        theme: ThemeData(
            primarySwatch: Colors.green,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
            ),
            textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.blue)),
        home: nextScreen(),
      ),
    );
  }

  nextScreen() {
    if (GetStorage().read('userName') == null) {
      return const SplashScreen();
    } else {
        return const BottomNavigationBarScreen();

    }
  }
}
