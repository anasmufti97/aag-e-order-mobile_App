import 'package:aag_e_order_app/models/api_responses/all_policy_api_response.dart';
import 'package:aag_e_order_app/ui/screens/policy_screen/policy_screen.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';

class PolicyBalanceView extends StatefulWidget {
  const PolicyBalanceView(this.policy, this.clientName, this.clientAddress, {Key? key}) : super(key: key);
  final List<Policy> policy;
  final String clientName;
  final String clientAddress;

  @override
  _PolicyBalanceViewState createState() => _PolicyBalanceViewState();
}

class _PolicyBalanceViewState extends State<PolicyBalanceView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: ListView.separated(
        itemCount: widget.policy.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              widget.policy[index].name ?? '',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            trailing: Text(
              "Price : \$${widget.policy[index].price ?? ''}",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200, color: Colors.black),
            ),
            onTap: () {
              Nav.push(context, PolicyScreen(widget.policy[index].name!, widget.clientName, widget.clientAddress));
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
