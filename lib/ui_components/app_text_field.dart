import 'package:aag_e_order_app/utils/constants/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorMessage;
  final String? iconAddress;
  final bool isPassword;
  final TextInputType? keyboardType;
  final Color? backGroundColor;
  final BorderRadius borderRadius;
  final bool isMultiLine;
  final String? suffixText;
  final bool? suffixIcon;
  final onChanged;
  final FormFieldValidator? validator;
  final int? maxLength;

  const AppTextField(
      {Key? key,
      this.hintText,
      this.iconAddress,
      this.isPassword = false,
      this.keyboardType,
      this.controller,
      this.errorMessage,
      this.backGroundColor = Colors.white,
      this.borderRadius = UiConstants.textFieldBorderRadius,
      this.isMultiLine = false,
      this.suffixText,
      this.labelText,
      this.suffixIcon,
      this.onChanged,
      this.validator,
      this.maxLength})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isTextHidden = false;
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void initState() {
    _isTextHidden = widget.isPassword;
    _textFieldFocusNode.addListener(() {
      if (widget.iconAddress != null) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_final_locals
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      width: size.width * 0.77,
      child: TextFormField(
        validator: widget.validator,
        onChanged: widget.onChanged,
        focusNode: _textFieldFocusNode,
        controller: widget.controller,
        obscureText: _isTextHidden,
        keyboardType: widget.keyboardType,
        maxLines: widget.isMultiLine ? 5 : 1,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
            // border: OutlineInputBorder(
            //   borderRadius: widget.borderRadius,
            // ),
            fillColor: widget.backGroundColor,
            prefixIcon: (widget.iconAddress != null)
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      widget.iconAddress!,
                      color: _textFieldFocusNode.hasFocus ? Theme.of(context).primaryColor : Colors.grey,
                    ),
                  )
                : null,
            isCollapsed: false,
            isDense: false,
            filled: true,
            labelText: widget.labelText,
            hintText: widget.hintText,
            errorText: widget.errorMessage,
            suffixIcon: widget.isPassword
                ? IconButton(icon: Icon(_isTextHidden ? Icons.visibility_off : Icons.visibility), onPressed: _onVisibilityChange)
                : null,
            suffixText: widget.suffixText),
      ),
    );
  }

  void _onVisibilityChange() {
    setState(() {
      _isTextHidden = !_isTextHidden;
    });
  }
}
