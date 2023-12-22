class ProductModel {
  String productName;
  String productImage;
  bool isFavourite;
  String category;
  double price;

  ProductModel(
      {required this.productName,
      required this.productImage,
      required this.isFavourite,
      required this.category,
      required this.price});
}
