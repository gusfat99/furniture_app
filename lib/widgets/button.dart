import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String variant;
  final String color;
  final double height;
  final double width;
  final EdgeInsets margin;
  final double fontSize;
  final isLoading;

  const Button({
    super.key,
    required this.onPressed,
    required this.text,
    this.variant = 'contained',
    this.color = 'black',
    this.height = 56.0,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.fontSize = 18.0,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = whiteTextStyle;
    if (variant == "text") {
      textStyle = textStyles[color];
    }

    return Container(
      margin: margin,
      width: width,
      height: height,
      child: TextButton(
        onPressed: () {
          if (!isLoading) {
            onPressed();
          }
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(0),
            backgroundColor: variant == "text" ? kWhiteColor : kColors[color],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0))),
        child: isLoading
            ? (CircularProgressIndicator(
                color: kColors[color],
                backgroundColor: kGreyColor,
              ))
            : Text(
                text,
                style: ((textStyle)
                    ?.copyWith(fontSize: fontSize, fontWeight: semiBold)),
              ),
      ),
    );
  }
}
