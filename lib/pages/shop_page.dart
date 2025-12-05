import 'package:flutter/material.dart';
import 'package:union_shop/data/product_data.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/models/products.dart';
import 'package:union_shop/widgets/layout.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late List<Product> _products;
  String _sortOption = 'default';

  @override
  void initState() {
    super.initState();
    // Initialize _products with a mutable copy of allProducts
    _products = List.from(allProducts);
  }

  // Helper function to get the correct price (sale or regular) for sorting
  double _getPriceForSorting(Product product) {
    final priceString = product.isOnSale ? product.salePrice! : product.price;
    return double.parse(priceString.replaceAll('£', ''));
  }

  void _sortProducts() {
    setState(() {
      switch (_sortOption) {
        case 'alpha_asc':
          _products.sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'alpha_desc':
          _products.sort((a, b) => b.title.compareTo(a.title));
          break;
        case 'price_asc':
          _products.sort((a, b) =>
              _getPriceForSorting(a).compareTo(_getPriceForSorting(b)));
          break;
        case 'price_desc':
          _products.sort((a, b) =>
              _getPriceForSorting(b).compareTo(_getPriceForSorting(a)));
          break;
        default:
          // Reset to the original order
          _products = List.from(allProducts);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return MainLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Shop',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Sort by: '),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _sortOption,
                  items: const [
                    DropdownMenuItem(
                        value: 'default', child: Text('Featured')),
                    DropdownMenuItem(
                        value: 'alpha_asc',
                        child: Text('Alphabetically, A-Z')),
                    DropdownMenuItem(
                        value: 'alpha_desc',
                        child: Text('Alphabetically, Z-A')),
                    DropdownMenuItem(
                        value: 'price_asc',
                        child: Text('Price, low to high')),
                    DropdownMenuItem(
                        value: 'price_desc',
                        child: Text('Price, high to low')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _sortOption = value;
                        _sortProducts();
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmallScreen ? 2 : 4,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 48,
                  childAspectRatio: 0.7,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  // Use the ProductCard widget from main.dart
                  return ProductCard(product: _products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}