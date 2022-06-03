import 'package:aag_e_order_app/ui/screens/home_screen/client_screens/client_screen.dart';
import 'package:aag_e_order_app/ui/screens/home_screen/home_screen.dart';
import 'package:aag_e_order_app/ui/screens/order_screen/order_screen.dart';
import 'package:aag_e_order_app/ui/screens/product_categories/all_product_categories_list_screen.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarScreenState createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  void _changeIndex(int _index) {
    setState(() {
      _currentIndex = _index;
    });
    _pageController.animateToPage(
      _currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          HomeScreen(),
          ClientScreen(),
          // Container(
          //   color: Colors.red,
          //   child:const Center(child: Text("coming soon",style: TextStyle(color: Colors.white),)),
          // ),
          OrderScreen(),
          AllCategoriesListScreen(),
          //  Container(
          //    color: Colors.greenAccent,
          //    child:const Center(child: Text("coming soon",style: TextStyle(color: Colors.white),)),
          //  ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        onItemSelected: _changeIndex,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            tileColor: AppColors.green,
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: _currentIndex == 0 ? Colors.white : Colors.grey,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            activeColor: AppColors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            tileColor: AppColors.green,
            icon: SvgPicture.asset(
              "assets/icons/users.svg",
              height: 30,
              color: _currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            title: const Text(
              'Clients',
              style: TextStyle(color: Colors.white),
            ),
            activeColor: AppColors.red,
            inactiveColor: AppColors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            tileColor: AppColors.green,
            icon: SvgPicture.asset(
              "assets/icons/orders.svg",
              height: 30,
              color: _currentIndex == 2 ? Colors.white : Colors.grey,
            ),
            title: const Text(
              'Orders',
              style: TextStyle(color: Colors.white),
            ),
            activeColor: AppColors.red,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            tileColor: AppColors.green,
            icon: SvgPicture.asset(
              "assets/icons/products.svg",
              height: 30,
              color: _currentIndex == 3 ? Colors.white : Colors.grey,
            ),
            title: const Text(
              'Products',
              style: TextStyle(color: Colors.white),
            ),
            activeColor: AppColors.red,
            inactiveColor: AppColors.green,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
