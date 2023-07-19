import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class ProductGridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isFav;
  final String price;

  const ProductGridItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.isFav,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.zero,
        child: Container(
          width: ((MediaQuery.of(context).size.width - 66) / 2),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
                width: 134,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                title,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price,
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold)),
                  Container(
                    width: 44,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Image.asset(
                        isFav
                            ? 'assets/button_wishlist_active.png'
                            : 'assets/button_wishlist.png',
                        width: 44,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
