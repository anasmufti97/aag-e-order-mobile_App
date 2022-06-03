import 'package:aag_e_order_app/ui_components/loading_animation.dart';
import 'package:flutter/material.dart';

class LoadingScreenAnimation extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingScreenAnimation({Key? key, required this.child, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black54,
            alignment: Alignment.center,
            child: const LoadingAnimation(),
          ),
      ],
    );
  }
}
