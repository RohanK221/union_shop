import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/product_page.dart';

void main() {
  testWidgets('navigates to product page and shows ProductPage', (tester) async {
    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    // uses an ID from lib/data/product_data.dart
    final nav = tester.state<NavigatorState>(find.byType(Navigator));
    nav.pushNamed('/product/anchor-hoodie');
    await tester.pumpAndSettle();

    expect(find.byType(ProductPage), findsOneWidget);
  });
}