import 'package:aag_e_order_app/models/api_responses/client_detail_api_response.dart';
import 'package:aag_e_order_app/ui/screens/promotion_report_screen/policy_balance_screen.dart';
import 'package:aag_e_order_app/utils/constants/app_colors.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen(this.client, {Key? key}) : super(key: key);
  final Client client;

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SvgPicture.asset(
                    "assets/icons/menu.svg",
                    height: size.height * 0.06,
                    color: AppColors.green,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Text(
                    "Order",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.green),
                  ),
                  SizedBox(
                    height: size.height * 0.0,
                  ),
                  Container(
                    width: size.width * 0.3,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SvgPicture.asset(
                    "assets/icons/photo.svg",
                    height: size.height * 0.06,
                    color: AppColors.green,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Text(
                    "Photo",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.green),
                  ),
                  SizedBox(
                    height: size.height * 0.0,
                  ),
                  Container(
                    width: size.width * 0.3,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SvgPicture.asset(
                    "assets/icons/task.svg",
                    height: size.height * 0.06,
                    color: AppColors.green,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Text(
                    "Task",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.green),
                  ),
                  SizedBox(
                    height: size.height * 0.0,
                  ),
                  Container(
                    width: size.width * 0.3,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Surveys",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            )),
        SizedBox(
          height: size.height * 0.01,
        ),
        Card(
          child: Column(children: [
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/edit.svg",
                height: size.height * 0.04,
                color: AppColors.green,
              ),
              title: const Text(
                "Policy Balance",
                style: TextStyle(fontSize: 16, color: AppColors.green),
              ),
              onTap: () {
                Nav.push(context, PolicyBalanceScreen(widget.client.name!, widget.client.address!));
              },
            ),
          ]),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  widget.client.name ?? '',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                subtitle: const Text(
                  'Address: ',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey),
                ),
                trailing: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/location.svg",
                      height: size.height * 0.03,
                      color: AppColors.green,
                    ),
                    SizedBox(
                      height: size.height * 0.012,
                    ),
                    Expanded(
                      child: Text(
                        widget.client.address ?? '',
                        maxLines: 3,
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: AppColors.green),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ListTile(
                title: Text(
                  'POSID: ${widget.client.id ?? ' '}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone: ${widget.client.phone ?? ' '}',
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                    Text(
                      'Region: ${widget.client.region ?? ' '}',
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    "assets/icons/phone.svg",
                    height: size.height * 0.04,
                    color: AppColors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
