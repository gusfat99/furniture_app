import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class CategoryCardItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;

  const CategoryCardItem(
      {super.key,
      required this.imageUrl,
      required this.category,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - (2 * 24),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 102,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  SizedBox(
                    width: 155,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        category,
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            imageUrl,
            height: 122,
          )
        ],
      ),
    );
  }
}
