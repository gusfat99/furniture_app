import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/indikator_onboarding.dart';
import 'package:space/widgets/onboarding_item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class CreateOnboardingObj {
  String title;
  String subtitle;
  String imageUrl;

  CreateOnboardingObj(
      {required this.title, required this.subtitle, required this.imageUrl});
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;

  List<CreateOnboardingObj> boardingItems = [
    CreateOnboardingObj(
        title: 'Buy Furniture Easily',
        subtitle:
            'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
        imageUrl: 'assets/image_onboarding1.png'),
    CreateOnboardingObj(
        title: 'Fast Delivery',
        subtitle:
            'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
        imageUrl: 'assets/image_onboarding2.png'),
    CreateOnboardingObj(
        title: 'Best Price',
        subtitle:
            'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
        imageUrl: 'assets/image_onboarding3.png'),
  ];

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: [
                ...boardingItems.map((item) => OnBoardingItem(
                    title: item.title,
                    subtitle: item.subtitle,
                    imageUrl: item.imageUrl))
              ],
              options: CarouselOptions(
                enableInfiniteScroll: false,
                autoPlay: false,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                height: double.infinity,
                viewportFraction: 1,
                initialPage: currentIndex,
              ),
              carouselController: carouselController,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/sign-in");
                    },
                    child: Text(
                      "SKIP",
                      style: blackTextStyle.copyWith(fontSize: 18),
                    )),
                Row(
                  children: [
                    IndikatorOnBoarding(isActive: currentIndex == 0),
                    SizedBox(
                      width: 10,
                    ),
                    IndikatorOnBoarding(isActive: currentIndex == 1),
                    SizedBox(
                      width: 10,
                    ),
                    IndikatorOnBoarding(isActive: currentIndex == 2),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      if (currentIndex == 2) {
                        Navigator.pushReplacementNamed(context, "/sign-in");
                      } else {
                        carouselController.nextPage();
                      }
                    },
                    child: Text(
                      "NEXT",
                      style: blackTextStyle.copyWith(fontSize: 18),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
