import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class OnBoardingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const OnBoardingItem({super.key, required this.title, required this.subtitle, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 99),
        Image.asset(
          imageUrl,
          width: double.infinity,
        ),
        SizedBox(height: 127),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 26.0,
          ),
        ),
        Text(
          subtitle,
          style: greyTextStyle.copyWith(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
