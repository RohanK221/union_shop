class ProductVariation {
  final String color;
  final String imageUrl;

  const ProductVariation({
    required this.color,
    required this.imageUrl,
  });
}

class Product {
  final String id;
  final String title;
  final String price;
  final List<ProductVariation> variations;
  final String description;
  final bool isOnSale;
  final String? salePrice;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.variations,
    required this.description,
    this.isOnSale = false,
    this.salePrice,
  });

  String get imageUrl => variations.first.imageUrl;
}