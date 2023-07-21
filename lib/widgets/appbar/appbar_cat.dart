import 'package:flutter/material.dart';
import 'package:space/debouncer.dart';
import '../../theme.dart';

class AppBarCat extends StatefulWidget {
  final ValueChanged<String> onSearch;
  final String title;

  const AppBarCat({
    super.key,
    required this.title,
    required this.onSearch,
  });

  @override
  State<AppBarCat> createState() => _AppBarCatState();
}

class _AppBarCatState extends State<AppBarCat> {
  final searchController = TextEditingController(text: '');
  final debouncer = Debouncer(seconds: 2);

  void handleChanged(val) {
    debouncer.run(() => widget.onSearch(searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 60,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              child: const Icon(
                Icons.chevron_left,
                color: kBlackColor,
              ),
            ),
          ),
          const SizedBox(
            width: 18.0,
          ),
          Expanded(
              child: Text(
            widget.title,
            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
          )),
          const SizedBox(
            width: 18.0,
          ),
          InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Container(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  'assets/icon_search.png',
                  width: 24,
                ),
              )),
          const SizedBox(
            width: 18.0,
          ),
          InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(0),
                child: const Icon(
                  Icons.tune_sharp,
                  color: kBlackColor,
                  size: 24,
                ),
              )),
        ],
      ),
    );
  }
}
