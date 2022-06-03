import 'package:aag_e_order_app/models/model/product.dart';
import 'package:aag_e_order_app/utils/navigation_controller/navigator_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../product_detail_screen.dart';

class ProductsListView extends StatefulWidget {
  const ProductsListView(this.product, {Key? key, this.orderId}) : super(key: key);

  final List<Product> product;
  final int? orderId;

  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: ListView.separated(
        itemCount: widget.product.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product[index].productGenericName ?? '',
                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black),
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
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Quantity: ',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  '${widget.product[index].quantity ?? ''}',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            onTap: () {
              if (widget.orderId != null) {
                Nav.pushReplace(
                    context,
                    ProductDetailScreen(
                      widget.product[index].id!,
                      orderId: widget.orderId,
                    ));
              } else {
                Nav.push(
                    context,
                    ProductDetailScreen(
                      widget.product[index].id!,
                      orderId: widget.orderId,
                    ));
              }
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
