import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/shop_accessories.dart';

void main() {
  testWidgets('navigates to shop accessories and shows ShopAccessoriesPage', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final nav = tester.state<NavigatorState>(find.byType(Navigator));
      nav.pushNamed('/shop/accessories');
      await tester.pumpAndSettle();

      expect(find.byType(ShopAccessoriesPage), findsOneWidget);
    });
  });
}