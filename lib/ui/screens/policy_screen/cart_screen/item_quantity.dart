import 'package:aag_e_order_app/bloC/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemQuantity extends StatefulWidget {
  const ItemQuantity(this.quantity, this.itemId, {Key? key}) : super(key: key);
  final int quantity;
  final int itemId;

  @override
  _ItemQuantityState createState() => _ItemQuantityState();
}

class _ItemQuantityState extends State<ItemQuantity> {
  int count = 0;

  void increment() async {
    setState(() {
      count++;
    });
    context
        .read<CartCubit>()
        .updateCartItem(itemId: widget.itemId.toString(), quantity: count.toString())
        .then((value) => {context.read<CartCubit>().getCartItems()});
  }

  void decrement() async {
    if (count > 0) {
      setState(() {
        count--;
      });
      context
          .read<CartCubit>()
          .updateCartItem(itemId: widget.itemId.toString(), quantity: count.toString())
          .then((value) => {context.read<CartCubit>().getCartItems()});
    }
  }

  @override
  void initState() {
    super.initState();
    count = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          IconButton(onPressed: decrement, icon: const Icon(Icons.remove)),
          Text('$count'),
          IconButton(onPressed: increment, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
