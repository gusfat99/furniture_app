import 'package:flutter/material.dart';
import 'package:space/debouncer.dart';
import 'package:space/widgets/textInput.dart';
import '../../theme.dart';

class AppBarSearch extends StatefulWidget {
  final ValueChanged<String> onSearch;

  const AppBarSearch({
    super.key,
    required this.onSearch,
  });

  @override
  State<AppBarSearch> createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
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
                  controller: searchController,
                  onFieldSubmitted: (value) {
                    Navigator.pushNamed(context, '/search-result',
                        arguments: {'keyword': value});
                  },
                  adornmentRight: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        searchController.clear();
                        handleChanged('');
                      },
                      child: Container(
                        padding: EdgeInsets.all(0),
                        child: const Icon(
                          Icons.close,
                          color: kGreyColor,
                          size: 24,
                        ),
                      ))))
        ],
      ),
    );
  }
}
