import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    debugPrint('Button pressed - placeholder');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return Scaffold(
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
                      Navigator.pop(context);
                      navigateToHome(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('About Us'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/about-us');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shop),
                    title: const Text('Collections'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/collections');
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Column(
        children: [
          // Header
          Container(
            height: 100,
            color: Colors.white,
            child: Column(
              children: [
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
                          ),
                        ),
                        if (!isSmallScreen) ...[
                          TextButton(
                            onPressed: () => navigateToHome(context),
                            child: const Text(
                              'Home',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/about-us'),
                            child: const Text(
                              'About Us',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/collections'),
                            child: const Text(
                              'Collections',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                        const Spacer(),
                        Builder(
                          builder: (BuildContext innerContext) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.search,
                                      size: 18, color: Colors.grey),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(Icons.person_outline,
                                      size: 18, color: Colors.grey),
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/login'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.shopping_bag_outlined,
                                      size: 18, color: Colors.grey),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                if (isSmallScreen)
                                  IconButton(
                                    icon: const Icon(Icons.menu,
                                        size: 18, color: Colors.grey),
                                    onPressed: () {
                                      Scaffold.of(innerContext).openDrawer();
                                    },
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content - scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  child,
                  // Footer
                  Container(
                    width: double.infinity,
                    color: Colors.grey[300],
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
                              onPressed: () =>
                                  debugPrint('Search pressed'),
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
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () =>
                                  debugPrint('Sign up pressed'),
                              style: ElevatedButton.styleFrom(
                                maximumSize: const Size(160, 40),
                                backgroundColor:
                                    const Color(0xFF4d2963),
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
          ),
        ],
      ),
    );
  }
}