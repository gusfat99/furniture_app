import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space/widgets/category_card_item.dart';
import 'package:space/widgets/title_section.dart';

import 'indikator_onboarding.dart';

class CategorySection extends StatefulWidget {
  final EdgeInsets margin;
  final VoidCallback onPressedShowAll;
  final List<Map> carouselItem;

  const CategorySection(
      {super.key,
      this.margin = EdgeInsets.zero,
      required this.onPressedShowAll,
      required this.carouselItem});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: widget.margin,
        child: Column(children: [
          TitleSection(title: 'Category', onPress: widget.onPressedShowAll),
          SizedBox(
            height: 24,
          ),
          CarouselSlider(
              items: widget.carouselItem
                  .map((item) => CategoryCardItem(
                        category: item['category'],
                        title: item['title'],
                        imageUrl: item['imageUrl'],
                        onTap: () {
                          Navigator.pushNamed(context, '/category',
                              arguments: {'category': item['category']});
                        },
                      ))
                  .toList(),
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  height: 125,
                  viewportFraction: 1,
                  initialPage: carouselIndex,
                  onPageChanged: (index, reason) {
                    setState(() {
                      carouselIndex = index;
                    });
                  })),
          Container(
            margin: EdgeInsets.only(top: 13),
            child: Row(
                children: widget.carouselItem.map((item) {
              int index = widget.carouselItem.indexOf(item);

              return IndikatorOnBoarding(
                isActive: index == carouselIndex,
                margin: EdgeInsets.only(right: 10),
              );
            }).toList()),
          ),
        ]));
  }
}
