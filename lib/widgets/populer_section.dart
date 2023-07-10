import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/populer_card_item.dart';
import 'package:space/widgets/title_section.dart';

class PopulerSection extends StatefulWidget {
  final EdgeInsets margin;
  final VoidCallback onPressedShowAll;
  const PopulerSection(
      {super.key,
      this.margin = EdgeInsets.zero,
      required this.onPressedShowAll});

  @override
  State<PopulerSection> createState() => _PopulerSectionState();
}

class _PopulerSectionState extends State<PopulerSection> {
  List<Map> populerItems = [
    {
      'title': 'Poan Chair',
      'price': '\$34',
      'imageUrl': 'assets/image_product_popular1.png',
      'isWishlist': true,
    },
    {
      'title': 'Poan Chair',
      'price': '\$34.5',
      'imageUrl': 'assets/image_product_popular2.png',
      'isWishlist': false,
    },
    {
      'title': 'Poan Chair',
      'price': '\$38',
      'imageUrl': 'assets/image_product_popular3.png',
      'isWishlist': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: const EdgeInsets.fromLTRB(24, 24, 0, 0),
      decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 24),
            child: TitleSection(
                title: 'Populer',
                fontSizeTitle: 24.0,
                onPress: widget.onPressedShowAll),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: populerItems
                    .map((item) => PopulerCardItem(
                          isWishlist: item['isWishlist'],
                          price: item['price'],
                          title: item['title'],
                          imageUrl: item['imageUrl'],
                        ))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
