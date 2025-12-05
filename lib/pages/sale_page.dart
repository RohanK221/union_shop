import 'package:flutter/material.dart';
import 'package:union_shop/data/product_data.dart';
import 'package:union_shop/widgets/layout.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/models/products.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products =
        allProducts.where((p) => p.isOnSale).toList();
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmall = screenWidth < 600;

    return MainLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shop — Items for Sale',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmall ? 2 : 4,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 48,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, i) => ProductCard(product: products[i]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}