import 'package:flutter/material.dart';
import 'package:union_shop/models/products.dart';
import 'package:union_shop/widgets/layout.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductVariation _selectedVariation;

  @override
  void initState() {
    super.initState();
    _selectedVariation = widget.product.variations.first;
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),                child: Image.asset(
                  _selectedVariation.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_not_supported,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Image unavailable',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Product name
            Text(
              widget.product.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            // Product price
            Text(
              widget.product.price,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4d2963),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Color',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: DropdownButton<String>(
                value: _selectedVariation.color,                
                underline: const SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedVariation = widget.product.variations
                        .firstWhere((variation) => variation.color == newValue);
                  });
                },
                items: widget.product.variations
                    .map<DropdownMenuItem<String>>((ProductVariation variation) {
                  return DropdownMenuItem<String>(
                    value: variation.color,
                    child: Text(variation.color),
                  );
                }).toList(),
              ),
            ), 

            const SizedBox(height: 24), 

            // Product description
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              widget.product.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey, 
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
