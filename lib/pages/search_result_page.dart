import 'package:flutter/material.dart';
import 'package:space/data/products.dart';
import 'package:space/models/product_item.dart';
import 'package:space/theme.dart';
import 'package:space/widgets/appbar/appbar_search_result.dart';
import 'package:space/widgets/product_grid_item.dart';
import 'package:space/widgets/product_grid_skeleton.dart';
import 'package:space/widgets/product_list_item.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  late Map arguments;
  late String keyword = '';
  bool isGridView = true;
  bool isLoading = false;
  late List<ProductItem> products = [];

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      var productFiltered = productsData
          .where((el) => el.title
              .toLowerCase()
              .contains(arguments['keyword'].toLowerCase()))
          .toList();

      setState(() {
        products = productFiltered;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    keyword = !keyword.isEmpty ? keyword : arguments['keyword'];

    void handeSearch(val) {
      setState(() {
        isLoading = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        var productFiltered = productsData
            .where((el) => el.title.toLowerCase().contains(val.toLowerCase()))
            .toList();

        setState(() {
          products = productFiltered;
          isLoading = false;
        });
      });
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: kWhiteGreyColor,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 110),
          child: AppBarSearchResult(
            onSearch: (val) {
              if (val != '') {
                setState(() {
                  keyword = val;
                });
              } else {
                setState(() {
                  keyword = '';
                });
              }
              handeSearch(val);
            },
            defaultValue: keyword,
          ),
        ),
        body: TabBarView(children: [
          buildBody(),
          buildBody(),
          buildBody(),
          buildBody(),
        ]),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      children: [
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Search for : ${keyword}',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  setState(() {
                    isGridView = !isGridView;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    isGridView ? Icons.grid_view : Icons.list_outlined,
                    color: kBlackColor,
                    size: 24,
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        isLoading
            ? buildLoadingView()
            : (isGridView ? buildGridView() : buildListView()),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Widget buildGridView() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: products
          .map((item) => ProductGridItem(
                imageUrl: item.imageGridUrl,
                price: item.price,
                title: item.title,
                isFav: false,
              ))
          .toList(),
    );
  }

  Widget buildLoadingView() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: List<int>.filled(4, 0, growable: true)
          .map((_) => ProductGridSkeleton())
          .toList(),
    );
  }

  Widget buildListView() {
    return Column(
      children: products
          .map((item) => ProductListItem(
                imageUrl: item.imageUrl,
                price: item.price,
                title: item.title,
              ))
          .toList(),
    );
  }
}
