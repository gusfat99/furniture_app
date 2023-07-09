// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class IndikatorOnBoarding extends StatelessWidget {
  bool isActive = false;
  EdgeInsets margin;
  IndikatorOnBoarding(
      {super.key, required this.isActive, this.margin = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? kBlackColor : kLineDarkColor,
      ),
    );
  }
}
