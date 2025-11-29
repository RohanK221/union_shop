import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/data/product_data';
import 'package:union_shop/models/products.dart';
import 'package:union_shop/pages/product_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        for (var product in allProducts)
          '/product/${product.id}': (context) => ProductPage(product: product),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
    debugPrint('Button pressed - placeholder');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Define a breakpoint for small screens (e.g., less than 600 pixels)
    final bool isSmallScreen = screenWidth < 600;

    return Scaffold(
      // Conditionally add a Drawer for small screens
      drawer: isSmallScreen
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text(
                      'Union Shop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      navigateToHome(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shop),
                    title: const Text('Shop'),
                    onTap: () {
                      Navigator.pop(context);
                      placeholderCallbackForButtons(); // Keep existing functionality
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.print),
                    title: const Text('The Print Shack'),
                    onTap: () {
                      Navigator.pop(context);
                      placeholderCallbackForButtons(); // Keep existing functionality
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.local_offer),
                    title: const Text('SALE!'),
                    onTap: () {
                      Navigator.pop(context);
                      placeholderCallbackForButtons(); // Keep existing functionality
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {
                      Navigator.pop(context);
                      placeholderCallbackForButtons(); // Keep existing functionality
                    },
                  ),
                ],
              ),
            )
          : null, // No drawer on larger screens
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'NEW PRODUCTS OUT NOW!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Conditionally display navigation buttons for larger screens
                          if (!isSmallScreen) ...[
                            TextButton(
                              onPressed: () => debugPrint('HOME pressed'),
                              child: const Text(
                                'Home',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () => debugPrint('SHOP pressed'),
                              child: const Text(
                                'Shop',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  debugPrint('PRINT SCHACK pressed'),
                              child: const Text(
                                'The Print Shack',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () => debugPrint('Sale pressed'),
                              child: const Text(
                                'SALE!',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () => debugPrint('ABOUT pressed'),
                              child: const Text(
                                'About',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                          const Spacer(),
                          // Action icons (Search, Person, Shopping Bag) and conditional Menu icon
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Builder(
                              // Add Builder here
                              builder: (BuildContext innerContext) {
                                // Use innerContext
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.search,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                        minWidth: 32,
                                        minHeight: 32,
                                      ),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.person_outline,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                        minWidth: 32,
                                        minHeight: 32,
                                      ),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.shopping_bag_outlined,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(
                                        minWidth: 32,
                                        minHeight: 32,
                                      ),
                                      onPressed: placeholderCallbackForButtons,
                                    ),
                                    if (isSmallScreen)
                                      IconButton(
                                        icon: const Icon(
                                          Icons.menu,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        padding: const EdgeInsets.all(8),
                                        constraints: const BoxConstraints(
                                          minWidth: 32,
                                          minHeight: 32,
                                        ),
                                        onPressed: () {
                                          // Use the innerContext provided by the Builder
                                          Scaffold.of(innerContext)
                                              .openDrawer();
                                        },
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(
                              0.7), // Corrected withValues to withOpacity
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'NEW Hoodies',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Come and grab yours while stocks lasts!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'PRODUCTS SECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: isSmallScreen ? 2 : 4,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      // Manually create a card for each of the two products
                      children: [
                        ProductCard(product: allProducts[0]),
                        ProductCard(product: allProducts[1]),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Opening Hours',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('(Term Time)'),
                      SizedBox(height: 8),
                      Text('Monday - Friday: 10am - 4pm'),
                      SizedBox(height: 16),
                      Text('(Outside of Term Time / Consolidation Weeks)'),
                      SizedBox(height: 8),
                      Text('Monday - Friday: 10am - 3pm'),
                      SizedBox(height: 8),
                      Text('Purchase Online 24/7'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Help and Information',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () => debugPrint('Search pressed'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                        ),
                        child: const Text('Search'),
                      ),
                      TextButton(
                        onPressed: () => debugPrint('t&c pressed'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                        ),
                        child: const Text('Terms & Conditions policy'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Latest Offers',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => debugPrint('Sign up pressed'),
                        style: ElevatedButton.styleFrom(
                          maximumSize: const Size(160, 40),
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text('SUBSCRIBE'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product; // Accept a Product object

  const ProductCard({
    super.key,
    required this.product, // Make it required
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product/${product.id}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imageUrl, // Use data from the product object
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.title, // Use data from the product object
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            product.price, // Use data from the product object
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4d2963)),
          ),
        ],
      ),
    );
  }
}
