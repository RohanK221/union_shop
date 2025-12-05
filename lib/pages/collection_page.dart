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
        'route': '/shop/clothing',
      },
      {
        'title': 'Stationery',
        'image': 'assets/images/notebook/blue.png',
        'route': '/shop/stationery',
      },
      {
        'title': 'Accessories',
        'image': 'assets/images/mug/white.png',
        'route': '/shop/accessories',
      },
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return MainLayout(
      child: SingleChildScrollView(
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmallScreen ? 1 : 3,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isSmallScreen ? 1.5 : 1.2,
                ),
                itemCount: collections.length,
                itemBuilder: (context, index) {
                  final item = collections[index];
                  return GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, item['route']!),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            item['image']!,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.4),
                          ),
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}