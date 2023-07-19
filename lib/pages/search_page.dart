import 'package:flutter/material.dart';
import 'package:space/data/products.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/appbar/appbar_search.dart';
import 'package:space/widgets/product_list_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String keyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteGreyColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: AppBarSearch(
          onSearch: (value) {},
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          const SizedBox(
            height: 41,
          ),
          Text(
            'Recommendation',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 20,
          ),
          ...productsData.where((element) => element.isRecomend).map((item) {
            return ProductListItem(
              imageUrl: item.imageUrl,
              price: item.price,
              title: item.title,
            );
          }).toList(),
        ],
      ),
    );
  }
}
