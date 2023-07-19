class ProductItem {
  final String imageUrl;
  final String imageGridUrl;
  final String price;
  final String title;
  final String category;
  final bool isRecomend;

  const ProductItem(
      {required this.imageUrl,
      required this.imageGridUrl,
      required this.title,
      required this.price,
      required this.category,
      required this.isRecomend});
}
