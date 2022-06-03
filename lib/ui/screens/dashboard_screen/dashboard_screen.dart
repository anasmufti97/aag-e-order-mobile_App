import 'package:aag_e_order_app/ui/screens/dashboard_screen/side_menu.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreen,
        // leading: const Icon(Icons.menu, color: AppColors.offWhite,),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: AppColors.offWhite),
        ),
      ),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: Column(children: [
        Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              border: TableBorder.all(
                color: Colors.black26,
                width: 1,
                style: BorderStyle.none,
              ),
              children: const [
                TableRow(children: [
                  TableCell(
                      child: Text(
                    'Turnover',
                    style: TextStyle(fontSize: 18),
                  )),
                  TableCell(
                    child: Text(''),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text(
                    'Today',
                    style: TextStyle(fontSize: 16),
                  )),
                  TableCell(
                    child: Text(
                      '0.0',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text(
                    'This Week',
                    style: TextStyle(fontSize: 16),
                  )),
                  TableCell(
                    child: Text(
                      '0.00',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                      child: Text(
                    'This Month',
                    style: TextStyle(fontSize: 16),
                  )),
                  TableCell(
                    child: Text(
                      '0.00',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
