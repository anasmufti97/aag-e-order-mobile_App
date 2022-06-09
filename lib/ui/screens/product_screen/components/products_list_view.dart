import 'package:aag_e_order_app/models/model/product.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/api_responses/all_product_api_response.dart';
import '../product_detail_screen.dart';

class ProductsListView extends StatefulWidget {
  const ProductsListView(this.product, {Key? key}) : super(key: key);

  final AllProductApiResponse product;

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: ListView.builder(
        itemCount: widget.product.data!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Item Name : ${widget.product.data?[index].itemName ?? ''}",
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Item Number : ${widget.product.data?[index].itemNumber ?? ''}",
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       'Price: ',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //     Text(
                  //       '\$${widget.product[index].price ?? ''}',
                  //       style: const TextStyle(
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
