import 'package:flutter/material.dart';
import 'package:union_shop/widgets/layout.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final collections = [
      {
        'title': 'Clothing',
        'image': 'assets/images/anchordesign/blackhoodie.png',
        'category': 'Clothing',
      },
      {
        'title': 'Stationery',
        'image': 'assets/images/notebook/blue.png',
        'category': 'Stationery',
      },
      {
        'title': 'Accessories',
        'image': 'assets/images/mug/white.png',
        'category': 'Accessories',
      },
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return MainLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Collections',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmallScreen ? 1 : 3,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isSmallScreen ? 1.5 : 1.2,
                ),
                itemCount: collections.length,
                itemBuilder: (context, index) {
                  final collection = collections[index];
                  return CollectionCard(
                    title: collection['title']!,
                    imageUrl: collection['image']!,
                    category: collection['category']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollectionCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String category;

  const CollectionCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/shop', arguments: category);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4), // Dark overlay
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}