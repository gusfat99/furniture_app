import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/button.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const TitleSection({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        Container(
          padding: EdgeInsets.zero,
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Show all',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  minimumSize: Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft)),
        )
      ],
    );
  }
}
