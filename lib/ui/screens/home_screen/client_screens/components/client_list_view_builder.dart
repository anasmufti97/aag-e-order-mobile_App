import 'package:aag_e_order_app/models/api_responses/all_client_api_response.dart';
import 'package:aag_e_order_app/ui/screens/home_screen/client_screens/coca_cola_details.dart';
import 'package:aag_e_order_app/ui/screens/policy_screen/policy_screen.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';

import '../../../promotion_report_screen/policy_balance_screen.dart';

class ClientViewBuilder extends StatefulWidget {
  const ClientViewBuilder(this.client, {Key? key}) : super(key: key);

  final AllClientApiResponse? client;

  @override
  _ClientViewBuilderState createState() => _ClientViewBuilderState();
}

class _ClientViewBuilderState extends State<ClientViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.client?.data?.length ?? 0,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              widget.client?.data?[index].name ?? '',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Address:  ${widget.client?.data?[index].address ?? ''}"),
                Text("Phone:  ${widget.client?.data?[index].phone ?? ''}"),
                Text("Email:  ${widget.client?.data?[index].email ?? ''}"),
                Text("Fax:  ${widget.client?.data?[index].fax ?? ''}"),
                Text("Customer Account:  ${widget.client?.data?[index].address ?? ''}"),

              ],
            ),
            onTap: () {
              Nav.push(context, PolicyBalanceScreen(widget.client!.data![index].customerAccount!));
            },
          ),
        );
      },
    );
  }
}
