import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class ToastContainer extends StatelessWidget {
  final String type;
  final String message;
  const ToastContainer({super.key, required this.type, required this.message});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    switch (type) {
      case "error":
        bgColor = kRedColor;
        break;
      case "success":
        bgColor = kBlueColor;
        break;
      case "warning":
        bgColor = kYellowColor;
        break;
      case "info":
        bgColor = kAccentColor;
        break;
      default:
        bgColor = kAccentColor;
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message,
        style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
      ),
    );
  }
}
