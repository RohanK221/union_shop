import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/shop_clothing.dart';

void main() {
  testWidgets('navigates to shop clothing and shows ShopClothingPage', (tester) async {
    await tester.pumpWidget(const UnionShopApp());
    await tester.pumpAndSettle();

    final nav = tester.state<NavigatorState>(find.byType(Navigator));
    nav.pushNamed('/shop/clothing');
    await tester.pumpAndSettle();

    expect(find.byType(ShopClothingPage), findsOneWidget);
  });
}