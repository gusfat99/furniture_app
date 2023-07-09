import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/category_section.dart';
import 'package:space/widgets/header_home.dart';
import 'package:space/widgets/textInput.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController(text: '');

  List<Map> categoryItems = [
    {
      "id": 1,
      "imageUrl": "assets/image_product_category1.png",
      "title": "Minimalis Chair",
      "category": "Chair",
    },
    {
      "id": 2,
      "imageUrl": "assets/image_product_category2.png",
      "title": "Minimalis Table",
      "category": "Table",
    },
    {
      "id": 3,
      "imageUrl": "assets/image_product_category3.png",
      "title": "Minimalis Table",
      "category": "Table",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteGreyColor,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: kWhiteColor,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_home.png',
                    width: 24,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_wishlist.png',
                    width: 24,
                  ),
                  label: 'wishlist'),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon_profile.png',
                    width: 24,
                  ),
                  label: 'profile'),
            ],
          ),
        ),
        body: Stack(children: [
          Image.asset('assets/image_background.png'),
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  HeaderHome(
                    margin: EdgeInsets.only(bottom: 30),
                  ),
                  TextInput(
                      hintText: 'Search Furniture',
                      color: kWhiteColor,
                      controller: searchController,
                      adornmentRight: Container(
                        padding: EdgeInsets.zero,
                        height: 18,
                        width: 18,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Image.asset(
                            'assets/icon_search.png',
                            width: 18.0,
                          ),
                          onPressed: () {},
                        ),
                      )),
                  CategorySection(
                      margin: EdgeInsets.only(top: 30),
                      onPressedShowAll: () {},
                      carouselItem: categoryItems)
                ],
              ),
            ),
          ),
        ]));
  }
}
