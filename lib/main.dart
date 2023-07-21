import 'package:flutter/material.dart';
import 'package:space/pages/category_page.dart';
import 'package:space/pages/home_page.dart';
import 'package:space/pages/onboarding_page.dart';
import 'package:space/pages/search_page.dart';
import 'package:space/pages/search_result_page.dart';
import 'package:space/pages/signin_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SigninPage(),
        '/home': (context) => HomePage(),
        '/search': (context) => const SearchPage(),
        '/search-result': (context) => const SearchResultPage(),
        '/category': (context) => const CategoryPage()
      },
    );
  }
}
