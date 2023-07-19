import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class ProductListItem extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String title;

  const ProductListItem(
      {super.key,
      required this.imageUrl,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            width: 60.0,
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              Text(
                price,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              )
            ],
          )
        ],
      ),
    );
  }
}
