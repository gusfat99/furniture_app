import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/category_section.dart';
import 'package:space/widgets/header_home.dart';
import 'package:space/widgets/populer_section.dart';
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
              padding: EdgeInsets.only(top: 24),
              child: ListView(
                children: [
                  const HeaderHome(margin: EdgeInsets.fromLTRB(24, 0, 24, 30)),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextInput(
                        onTap: () {
                          Navigator.pushNamed(context, '/search');
                        },
                        onChanged: (value) {
                          Navigator.pushNamed(context, '/search');
                        },
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
                            onPressed: () {
                              Navigator.pushNamed(context, '/search');
                            },
                          ),
                        )),
                  ),
                  CategorySection(
                      margin: const EdgeInsets.fromLTRB(24, 30, 24, 0),
                      onPressedShowAll: () {},
                      carouselItem: categoryItems),
                  PopulerSection(
                    margin: const EdgeInsets.only(top: 24.7),
                    onPressedShowAll: () {},
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
