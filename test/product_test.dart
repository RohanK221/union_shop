import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/data/product_data.dart';
import 'package:union_shop/models/products.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/widgets/layout.dart';

void main() {
  // Select a sample product to use for testing.
  final Product testProduct = allProducts.first;

  // A helper function to create the widget for testing.
  Widget createTestWidget() {
    return MaterialApp(
      home: ProductPage(product: testProduct),
    );
  }

  group('ProductPage Tests', () {
    testWidgets('should display the correct product details', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        expect(find.text(testProduct.title), findsOneWidget);
        expect(find.text(testProduct.price), findsOneWidget);
        expect(find.text(testProduct.description), findsOneWidget);
      });
    });

    testWidgets('should display product image', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        expect(find.byType(Image), findsWidgets);
      });
    });

    testWidgets('should be wrapped in MainLayout', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        expect(find.byType(MainLayout), findsOneWidget);
      });
    });
  });
}
