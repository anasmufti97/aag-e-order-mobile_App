import 'package:aag_e_order_app/models/api_responses/all_policy_api_response.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';

import '../../product_screen/products_screens.dart';

class PolicyBalanceView extends StatefulWidget {
  const PolicyBalanceView(this.allPolicyApiResponse, {Key? key}) : super(key: key);
  final AllPolicyApiResponse allPolicyApiResponse;

  @override
  _PolicyBalanceViewState createState() => _PolicyBalanceViewState();
}

class _PolicyBalanceViewState extends State<PolicyBalanceView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: ListView.builder(
        itemCount: widget.allPolicyApiResponse.data!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Nav.push(context, ProductsScreen(widget.allPolicyApiResponse.data![index].policyCode!));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Policy Code :  ${widget.allPolicyApiResponse.data?[index].policyCode ?? ''}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Policy Balance :  ${widget.allPolicyApiResponse.data?[index].policyBalance ?? ''}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Policy Description :  ${widget.allPolicyApiResponse.data?[index].policyDescription ?? ''}",
                      maxLines: 10,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
