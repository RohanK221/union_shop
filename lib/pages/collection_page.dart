import 'package:flutter/material.dart';
import 'package:union_shop/data/product_data.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/models/products.dart';
import 'package:union_shop/widgets/layout.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late List<Product> _products;
  String _sortOption = 'default';

  @override
  void initState() {
    super.initState();
    _products = List.from(allProducts);
  }

  double _parsePrice(String price) {
    return double.parse(price.replaceAll('£', ''));
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
          _products.sort((a, b) => _parsePrice(a.price).compareTo(_parsePrice(b.price)));
          break;
        case 'price_desc':
          _products.sort((a, b) => _parsePrice(b.price).compareTo(_parsePrice(a.price)));
          break;
        default:
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
              'Our Collection',
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
                    DropdownMenuItem(value: 'default', child: Text('Featured')),
                    DropdownMenuItem(value: 'alpha_asc', child: Text('Alphabetically, A-Z')),
                    DropdownMenuItem(value: 'alpha_desc', child: Text('Alphabetically, Z-A')),
                    DropdownMenuItem(value: 'price_asc', child: Text('Price, low to high')),
                    DropdownMenuItem(value: 'price_desc', child: Text('Price, high to low')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      _sortOption = value;
                      _sortProducts();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isSmallScreen ? 2 : 4,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                childAspectRatio: 0.7,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: _products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}