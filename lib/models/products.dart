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
  final List<ProductVariation> variations; // This is the missing property
  final String description;

  // This is a helper to get the first image for the main product grid
  String get imageUrl => variations.first.imageUrl;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.variations, // Add it to the constructor
    required this.description,
  });
}