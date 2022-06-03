import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OutStandingView extends StatefulWidget {
  const OutStandingView({Key? key}) : super(key: key);

  @override
  _OutStandingViewState createState() => _OutStandingViewState();
}

class _OutStandingViewState extends State<OutStandingView> {
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
              color: Colors.blueGrey,
              boxShadow: [
                BoxShadow(color: Colors.black45, blurRadius: 20.0, spreadRadius: -1.0, offset: Offset(0, -2)
                    // shadow direction: bottom right
                    )
              ],
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "OutStanding".toUpperCase(),
              style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
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
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/dollar_bag.svg",
                        height: size.height * 0.06,
                      ),
                      const Text(
                        "1000",
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
            Container(
              color: Colors.grey,
              height: 70,
              width: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "Overdue",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 150,
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
                        "1000",
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
