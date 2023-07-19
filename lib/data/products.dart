import 'package:space/models/product_item.dart';

List<ProductItem> productsData = [
  const ProductItem(
    imageUrl: 'assets/image_product_list1.png',
    imageGridUrl: 'assets/image_product_grid1.png',
    title: 'Poan Chair',
    price: '\$34',
    category: 'chair',
    isRecomend: true,
  ),
  const ProductItem(
      imageUrl: 'assets/image_product_list2.png',
      imageGridUrl: 'assets/image_product_grid2.png',
      title: 'Poan Maharani',
      category: 'chair',
      isRecomend: true,
      price: '\$32'),
  const ProductItem(
      imageUrl: 'assets/image_product_list3.png',
      imageGridUrl: 'assets/image_product_grid3.png',
      title: 'Chair',
      category: 'chair',
      isRecomend: true,
      price: '\$32'),
  const ProductItem(
      imageUrl: 'assets/image_product_list4.png',
      imageGridUrl: 'assets/image_product_grid4.png',
      title: 'Chair Maharani',
      category: 'chair',
      isRecomend: false,
      price: '\$31'),
  const ProductItem(
      imageUrl: 'assets/image_product_list4.png',
      imageGridUrl: 'assets/image_product_grid4.png',
      title: 'Old Chair',
      category: 'chair',
      isRecomend: false,
      price: '\$31'),
  const ProductItem(
      imageUrl: 'assets/image_product_list4.png',
      imageGridUrl: 'assets/image_product_grid4.png',
      title: 'Poan Table',
      isRecomend: true,
      category: 'table',
      price: '\$30'),
];
