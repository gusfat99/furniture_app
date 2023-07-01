// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class IndikatorOnBoarding extends StatelessWidget {
  bool isActive = false;
  IndikatorOnBoarding({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? kBlackColor : kLineDarkColor,
      ),
    );
  }
}
