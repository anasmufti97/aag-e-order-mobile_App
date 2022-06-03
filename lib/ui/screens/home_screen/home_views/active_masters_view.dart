import 'package:aag_e_order_app/models/api_responses/dashboard_api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActiveMastersView extends StatefulWidget {
  const ActiveMastersView(this.dashboardData, {Key? key}) : super(key: key);
  final DashboardData dashboardData;

  @override
  _ActiveMastersViewState createState() => _ActiveMastersViewState();
}

class _ActiveMastersViewState extends State<ActiveMastersView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: size.width,
          height: size.height * 0.07,
          decoration: const BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(color: Colors.black38, blurRadius: 20.0, spreadRadius: -1.0, offset: Offset(0, -2)
                    // shadow direction: bottom right
                    )
              ],
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Active Masters".toUpperCase(),
              style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "Items",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: size.width * 0.30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/rubik.svg",
                        height: size.height * 0.06,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "${widget.dashboardData.products ?? 0}",
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
            Container(
              color: Colors.grey,
              height: 90,
              width: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "Customers",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: size.width * 0.30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/user.svg",
                        height: size.height * 0.06,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "${widget.dashboardData.clients ?? 0}",
                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
            Container(
              color: Colors.grey,
              height: 90,
              width: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "Price List",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: size.width * 0.30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/dollar.svg",
                        height: size.height * 0.06,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      const Text(
                        "0",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    );
  }
}
