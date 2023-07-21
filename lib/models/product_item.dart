class ProductItem {
  final String imageUrl;
  final String imageGridUrl;
  final String price;
  final String title;
  final String category;
  final bool isRecomend;
  final int id;

  const ProductItem(
      {required this.id,
      required this.imageUrl,
      required this.imageGridUrl,
      required this.title,
      required this.price,
      required this.category,
      required this.isRecomend});
}
