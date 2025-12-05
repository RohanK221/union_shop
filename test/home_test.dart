import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/data/product_data.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with hero and product section',
        (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        // Check that hero section elements are present
        expect(find.text('NEW Hoodies'), findsOneWidget);
        expect(
            find.text("Come and grab yours while stocks lasts!"), findsOneWidget);
        expect(find.text('BROWSE PRODUCTS'), findsOneWidget);

        // Check that the product section title is present
        expect(find.text('PRODUCTS SECTION'), findsOneWidget);
      });
    });

    testWidgets('should display the first four product cards', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        // Check that the first 4 products from your data are displayed
        expect(find.text(allProducts[0].title), findsOneWidget);
        expect(find.text('£${allProducts[0].price}'), findsOneWidget);

        expect(find.text(allProducts[1].title), findsOneWidget);
        expect(find.text('£${allProducts[1].price}'), findsOneWidget);

        expect(find.text(allProducts[2].title), findsOneWidget);
        expect(find.text('£${allProducts[2].price}'), findsOneWidget);
        
        expect(find.text(allProducts[3].title), findsOneWidget);
        expect(find.text('£${allProducts[3].price}'), findsOneWidget);

        // Verify there are exactly 4 ProductCard widgets on the home screen
        expect(find.byType(ProductCard), findsNWidgets(4));
      });
    });

    testWidgets('should display header banner and icons', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        // Check that header banner and icons are present
        expect(find.text('NEW PRODUCTS OUT NOW!'), findsOneWidget);
        expect(find.byIcon(Icons.search), findsOneWidget);
        expect(find.byIcon(Icons.person_outline), findsOneWidget);
        expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      });
    });

    testWidgets('should display footer content', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const UnionShopApp());
        await tester.pumpAndSettle();

        // Check that footer section titles are present
        expect(find.text('Opening Hours'), findsOneWidget);
        expect(find.text('Help and Information'), findsOneWidget);
        expect(find.text('Latest Offers'), findsOneWidget);
        expect(find.text('SUBSCRIBE'), findsOneWidget);
      });
    });
  });
}

