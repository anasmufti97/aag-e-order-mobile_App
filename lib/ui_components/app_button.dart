import 'package:aag_e_order_app/utils/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'loading_animation.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String? icon;
  final Color? color;
  final Color? textColor;
  final bool isLoading;

  const AppButton({Key? key, required this.text, this.onPressed, this.icon, this.isLoading = false, this.color, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: UiConstants.textFieldBorderRadius,
          ),
        ),
        child: isLoading
            ? const Center(
                child: LoadingAnimation(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: SvgPicture.asset(
                        icon!,
                        height: 21,
                      ),
                    ),
                  Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
