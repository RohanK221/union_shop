import 'package:union_shop/models/products.dart';

final List<Product> allProducts = [
  const Product(
    id: 'anchor-hoodie',
    title: 'Portsmouth Anchor Hoodie',
    price: '£35.00',
    isOnSale: true,
    salePrice: '£25.00',
    variations: [
      ProductVariation(
        color: 'Black',
        imageUrl: 'assets/images/anchordesign/blackhoodie.png',
      ),
      ProductVariation(
         color: 'Grey',
         imageUrl: 'assets/images/anchordesign/greyhoodie.png',
      ),
      ProductVariation(
         color: 'Red',
         imageUrl: 'assets/images/anchordesign/redhoodie.png',
      ),
    ],
    description: 'A navy themed design on a comfortable hoodie.',
  ),
  const Product(
    id: 'club-hoodie',
    title: 'Portsmouth Football Hoodie',
    price: '£35.00',
    variations: [
      ProductVariation(
        color: 'Blue',
        imageUrl: 'assets/images/clubdesign/bluehoodie.png',
      ),
      ProductVariation(
         color: 'Grey',
         imageUrl: 'assets/images/clubdesign/greyhoodie.png',
       ),
      ProductVariation(
         color: 'Red',
         imageUrl: 'assets/images/clubdesign/redhoodie.png',
      ),
    ],
    description: 'A comfortable and stylish football themed hoodie.',
  ),
  const Product(
    id: 'Sweatshirt',
    title: 'Navy themed Sweatshirt',
    price: '£30.00',
    variations: [
      ProductVariation(
        color: 'Blue',
        imageUrl: 'assets/images/sweatshirt/blue.png',
      ),
      ProductVariation(
         color: 'Black',
         imageUrl: 'assets/images/sweatshirt/black.png',
      ),
    ],
    description: 'A comfortable and stylish navy themed sweatshirt.',
  ),
  const Product(
    id: 'Pen1',
    title: 'Pen',
    price: '£1.00',
    variations: [
      ProductVariation(
        color: 'Blue',
        imageUrl: 'assets/images/pen/blue.png',
      ),
      ProductVariation(
         color: 'Black',
         imageUrl: 'assets/images/pen/black.png',
      ),
    ],
    description: 'A Portsmouth University branded pen.',
  ),
  const Product(
    id: 'Notebook1',
    title: 'Notebook',
    price: '£2.00',
    variations: [
      ProductVariation(
        color: 'Black',
        imageUrl: 'assets/images/notebook/black.png',
      ),
      ProductVariation(
         color: 'Blue',
         imageUrl: 'assets/images/notebook/blue.png',
      ),
    ],
    description: 'A Portsmouth University branded notebook.',
  ),
  const Product(
    id: 'Mug1',
    title: 'Mug',
    price: '£1.50',
    variations: [
      ProductVariation(
        color: 'White',
        imageUrl: 'assets/images/mug/white.png',
      ),
      ProductVariation(
         color: 'Black',
         imageUrl: 'assets/images/mug/black.png',
      ),
      ProductVariation(
         color: 'Blue',
         imageUrl: 'assets/images/mug/blue.png',
      ),
    ],
    description: 'A Portsmouth University branded mug.',
  ),
];