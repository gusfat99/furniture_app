import 'package:flutter/material.dart';
import 'package:space/theme.dart';

class PopulerCardItem extends StatelessWidget {
  final bool isWishlist;
  final String price;
  final String title;
  final String imageUrl;

  const PopulerCardItem(
      {super.key,
      required this.isWishlist,
      required this.price,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              height: 181,
              width: 200,
              decoration: BoxDecoration(
                  color: kWhiteGreyColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  width: 140,
                ),
              ),
            ),
            Container(
              height: 120,
              width: 200,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              isWishlist
                                  ? 'assets/button_wishlist_active.png'
                                  : 'assets/button_wishlist.png',
                              width: 44,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
