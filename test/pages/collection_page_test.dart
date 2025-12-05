import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/collection_page.dart';

void main() {
  testWidgets('navigates to collections and shows CollectionPage', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final nav = tester.state<NavigatorState>(find.byType(Navigator));
      nav.pushNamed('/collections');
      await tester.pumpAndSettle();

      expect(find.byType(CollectionPage), findsOneWidget);
    });
  });
}