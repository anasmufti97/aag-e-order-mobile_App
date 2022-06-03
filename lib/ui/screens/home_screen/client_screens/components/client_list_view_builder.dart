import 'package:aag_e_order_app/models/api_responses/all_client_api_response.dart';
import 'package:aag_e_order_app/ui/screens/home_screen/client_screens/coca_cola_details.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/material.dart';

class ClientViewBuilder extends StatefulWidget {
  const ClientViewBuilder(this.client, {Key? key}) : super(key: key);

  final List<Client> client;

  @override
  _ClientViewBuilderState createState() => _ClientViewBuilderState();
}

class _ClientViewBuilderState extends State<ClientViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.client.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            widget.client[index].name ?? '',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          subtitle: Text(widget.client[index].address ?? ''),
          onTap: () {
            Nav.push(context, CocaColaScreen(widget.client[index].id!, widget.client[index].name!));
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
