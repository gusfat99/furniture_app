import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space/theme.dart';

class ShimmerItem extends StatelessWidget {
  final double? width;
  final double height;
  final String? variant;

  const ShimmerItem(
      {super.key,
      this.width = double.infinity,
      required this.height,
      this.variant = 'rectangle'});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: kLineDarkColor,
        highlightColor: kWhiteColor,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: variant == 'circle' ? BoxShape.circle : BoxShape.rectangle,
            color: kLineDarkColor,
          ),
        ));
  }
}
