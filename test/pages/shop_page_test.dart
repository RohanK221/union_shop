import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/shop_page.dart';

void main() {
  testWidgets('navigates to shop and shows ShopPage', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final nav = tester.state<NavigatorState>(find.byType(Navigator));
      nav.pushNamed('/shop');
      await tester.pumpAndSettle();

      expect(find.byType(ShopPage), findsOneWidget);
    });
  });
}