import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class TextInput extends StatelessWidget {
  final EdgeInsets margin;
  final String hintText;
  final bool obscureText;
  final bool autoFocus;
  final Widget? adornmentRight;
  final TextEditingController controller;
  final Color color;

  TextInput(
      {super.key,
      this.margin = EdgeInsets.zero,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
      this.autoFocus = false,
      this.color = kWhiteGreyColor,
      this.adornmentRight});

  @override
  Widget build(BuildContext context) {
    List<Widget> childOfTextField = [
      Expanded(
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          autofocus: autoFocus,
          decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: greyTextStyle.copyWith(fontSize: 14)),
        ),
      ),
    ];

    if (adornmentRight != null) {
      childOfTextField.add(adornmentRight!);
    }

    return Container(
        margin: margin,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: childOfTextField.toList(),
        ));
  }
}
