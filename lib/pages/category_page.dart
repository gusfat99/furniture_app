import 'package:flutter/material.dart';
import 'package:space/data/products.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/appbar/appbar_cat.dart';
import 'package:space/widgets/category_card_item.dart';
import 'package:space/widgets/product_grid_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: AppBarCat(
          onSearch: (val) {},
          title: arguments['category'],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SizedBox(
              height: 13,
            ),
            SizedBox(
              height: 125,
              child: CategoryCardItem(
                imageUrl: "assets/image_product_category3.png",
                category: 'Chair',
                title: 'Minimalis Chair',
                onTap: () {},
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 18,
              runSpacing: 18,
              children: [
                ...productsData
                    .where((element) =>
                        element.category.toLowerCase() ==
                        arguments['category'].toLowerCase())
                    .map((item) {
                  return ProductGridItem(
                    imageUrl: item.imageGridUrl,
                    title: item.title,
                    isFav: false,
                    price: item.price,
                    onTap: () {},
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
