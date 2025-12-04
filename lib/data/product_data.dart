import 'package:union_shop/models/products.dart';

final List<Product> allProducts = [
  const Product(
    id: 'anchor-hoodie',
    title: 'Portsmouth Anchor Hoodie',
    price: '£35.00',
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
];