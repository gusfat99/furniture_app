import 'package:flutter/material.dart';
import 'package:space/debouncer.dart';
import 'package:space/widgets/textInput.dart';
import '../../theme.dart';

class AppBarSearchResult extends StatefulWidget {
  final ValueChanged<String> onSearch;
  final String? defaultValue;

  const AppBarSearchResult({
    super.key,
    this.defaultValue = '',
    required this.onSearch,
  });

  @override
  State<AppBarSearchResult> createState() => _AppBarSearchResultState();
}

class _AppBarSearchResultState extends State<AppBarSearchResult> {
  final _searchController = TextEditingController(text: '');
  final debouncer = Debouncer(seconds: 2);

  void handleChanged(val) {
    debouncer.run(() => widget.onSearch(_searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    _searchController.text = widget.defaultValue ?? '';

    return AppBar(
      backgroundColor: kWhiteColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 70,
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
            width: 15.0,
          ),
          Expanded(
            child: TextInput(
                hintText: 'Search Furnitur',
                controller: _searchController,
                onChanged: handleChanged,
                adornmentRight: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      _searchController.clear();
                      handleChanged('');
                    },
                    child: Container(
                      padding: EdgeInsets.all(0),
                      child: const Icon(
                        Icons.close,
                        color: kGreyColor,
                        size: 24,
                      ),
                    ))),
          ),
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
      bottom: TabBar(
          indicatorColor: kBlackColor,
          labelColor: kBlackColor,
          isScrollable: true,
          tabs: [
            Tab(
              text: 'Chair',
            ),
            Tab(
              text: 'Table',
            ),
            Tab(
              text: 'Accessories',
            ),
            Tab(
              text: 'Living Room',
            ),
          ]),
    );
  }
}
